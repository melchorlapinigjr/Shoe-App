import 'package:flutter/material.dart';
import 'package:flutter_shoe_app/core/services/api/api_service.dart';

import '../../app/app.locator.dart';

class LoginViewModel extends ChangeNotifier {
  bool isObscure = true;

  void changeObscure() {
    isObscure = isObscure == false ? true : false;
    notifyListeners();
  }

  //facebookLogin

  final ApiService apiService = locator<ApiService>();

  Future<void> loginFacebook() async {
    try {
      await apiService.facebookLogin();
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }
}
