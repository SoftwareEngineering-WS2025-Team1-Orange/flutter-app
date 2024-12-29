import 'package:bright_impact/state/api_service.dart';
import 'package:bright_impact/api/lib/openapi.dart';
import 'package:flutter/material.dart';

class AppState with ChangeNotifier {

  bool _isLoading = false;
  bool _isLoggedIn = false;

  bool get isLoading => _isLoading;
  bool get isLoggedIn => _isLoggedIn;

  Future<void> registerDonationbox(String id) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await ApiService.shared.getDonationboxApi().registerDonationbox(
        donatorId: 1,
        donationboxRegisterDto: DonationboxRegisterDto(cuid: id)
      );

      if ((response.statusCode ?? 0) >= 200 && (response.statusCode ?? 0) < 300) {
        _isLoggedIn = true;
      } else {
        _isLoggedIn = false;
      }

    } on Exception catch(e) {
        print("API call failed with error: $e");

    } finally { 
      _isLoading = false;
      notifyListeners();
    }
  } 

  void testLogIn() {
     _isLoggedIn = true;
    notifyListeners();
  }

}