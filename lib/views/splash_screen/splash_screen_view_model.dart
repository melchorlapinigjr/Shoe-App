import 'package:flutter/material.dart';
import 'package:flutter_shoe_app/app/app.locator.dart';
import 'package:flutter_shoe_app/app/app.router.dart';
import 'package:flutter_shoe_app/core/services/navigation/navigation_service.dart';

final NavigationService navigationService = locator<NavigationService>();

class SplashScreenViewModel extends ChangeNotifier {
  void init() async {
    await Future.delayed(const Duration(seconds: 6));
     navigationService.pushReplacementNamed(Routes.LoginView);
  }
}
