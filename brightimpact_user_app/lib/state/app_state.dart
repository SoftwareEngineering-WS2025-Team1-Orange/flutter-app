import 'dart:convert';

import 'package:bright_impact/model/donator.dart';
import 'package:bright_impact/model/token.dart';
import 'package:bright_impact/state/api_login.dart';
import 'package:bright_impact/state/api_provider_error.dart';
import 'package:bright_impact/state/api_service.dart';
import 'package:bright_impact/api/lib/openapi.dart';
import 'package:bright_impact/state/entity_provider/donator_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppState with ChangeNotifier {
  static const String _donatorKey = "donator";
  static const String _authTokenKey = "auth_token";
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  bool _isLoading = false;
  bool _isLoggedIn = false;
  Donator? _initialDiskDonator;

  final DonatorProvider _donatorProvider = DonatorProvider();

  bool get isLoading => _isLoading;
  bool get isLoggedIn => _isLoggedIn;

  Donator? get donator => _donatorProvider.entity ?? _initialDiskDonator;

  AppState() {
    _restoreState();

    // When logged in: setup donatorProvider and fetch data from server
    if (_initialDiskDonator != null) {
      _donatorProvider
        ..addListener(didUpdateDonator)
        ..setIdAndFetch(donator!.id);
    }
  }

  /// Loads stored objects
  Future<void> _restoreState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Load donator object
    String? donatorJson = prefs.getString(_donatorKey);
    if (donatorJson != null) {
      _initialDiskDonator = Donator.fromJson(jsonDecode(donatorJson));
      _isLoggedIn = true;
    } else {
      _isLoggedIn = false;
    }

    notifyListeners();
  }

  /// Stores donator object on disk
  Future<void> _saveDonator() async {
    if (donator != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String donatorJson = jsonEncode(donator!.toJson());
      await prefs.setString(_donatorKey, donatorJson);
    }
  }

  /// Deletes donator object on disk (use when user is logged out)
  Future<void> _deleteDonator() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_donatorKey);
  }

  /// Speichert den Auth-Token
  Future<void> _saveAuthToken(Token token) async {
    final tokenString = jsonEncode(token.toJson());
    await _secureStorage.write(key: _authTokenKey, value: tokenString);
  }

  /// Lädt den Auth-Token
  Future<Token?> _loadAuthToken() async {
    final tokenString = await _secureStorage.read(key: _authTokenKey);
    if (tokenString == null) return null;
    try {
      return Token.fromJson(jsonDecode(tokenString));
    } catch (e) {
      return null;
    }
  }

  /// Löscht den Auth-Token
  Future<void> _deleteAuthToken() async {
    await _secureStorage.delete(key: _authTokenKey);
  }

  /// Login-Logik
  Future<ApiProviderError?> login(String email, String password) async {
    final (token, error) = await ApiLogin().login(email, password);
    if (token == null) {
      return error ?? ApiProviderError.unknownError;
    }

    // Token will be used for all future requests
    ApiService.shared.setToken(token);

    // Explicity set id to -1 to use request ressource /donator/me
    await _donatorProvider.setIdAndFetch(-1);

    if (_donatorProvider.entity == null) {
      ApiService.shared.setToken(null);
      return ApiProviderError.unknownError;
    }

    // Now set id explicitly
    _donatorProvider.setId(_donatorProvider.entity!.id);

    await _saveDonator();
    await _saveAuthToken(token);

    _isLoggedIn = true;
    notifyListeners();

    return null;
  }

  /// Logout-Logik
  void logout() async {
    _initialDiskDonator = null;
    _isLoggedIn = false;

    ApiService.shared.setToken(null);
    
    await _deleteDonator();
    await _deleteAuthToken();

    notifyListeners();
  }

  void didUpdateDonator() {
    notifyListeners();
    _saveDonator();
  }

  Future<void> registerDonationbox(String id) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await ApiService.shared.api
          .getDonationboxApi()
          .registerDonationbox(
              donatorId: 1,
              donationboxRegisterDto: DonationboxRegisterDto(cuid: id, name: "Meine Donationbox"));

      if ((response.statusCode ?? 0) >= 200 &&
          (response.statusCode ?? 0) < 300) {
        _isLoggedIn = true;
      } else {
        _isLoggedIn = false;
      }
    } on Exception catch (e) {
      print("API call failed with error: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void testLogIn() {
    login("email", "passwort");
  }
}
