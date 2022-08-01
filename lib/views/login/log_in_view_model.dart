import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  bool isObscure = false;

  void changeObscure() {
    isObscure = isObscure == false ? true : false;
    notifyListeners();
  }
}
