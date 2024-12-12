import 'package:bright_impact/api/lib/openapi.dart';
import 'package:bright_impact/main.dart';
import 'package:flutter/material.dart';

class AppState with ChangeNotifier {

  bool _isLoading = false;
  bool _isLoggedIn = false;

  bool get isLoading => _isLoading;
  bool get isLoggedIn => _isLoggedIn;

  final DonationboxApi _donationboxApi = DonationboxApi(sharedDio);

  Future<void> registerDonationbox(String id) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await _donationboxApi.donatorDonatorIdDonationboxPost(
        donatorId: 1,
        donationboxRegisterDto: DonationboxRegisterDto(id: id)
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