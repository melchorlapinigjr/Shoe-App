import 'package:flutter/material.dart';
import 'package:flutter_shoe_app/app/app.locator.dart';
import 'package:flutter_shoe_app/core/services/api/api_service.dart';
import 'package:flutter_shoe_app/core/services/navigation/navigation_service.dart';
import 'package:flutter_shoe_app/core/services/shared_preferrence/shared_preference.dart';
import 'package:flutter_shoe_app/models/user_object.dart';
import 'package:flutter_shoe_app/utils/my_theme_data.dart';
import 'package:get/get.dart';

class ProfilePageViewModel extends ChangeNotifier {
  final ApiService apiService = locator<ApiService>();
  final SharedPreference sharedPreference = locator<SharedPreference>();
  final NavigationService navigationService = locator<NavigationService>();

  User? user;
  bool isDarkMode = false;
  bool setBusy = false;

  Future<void> initialize() async {
    setBusy = true;
    notifyListeners();
    try {
      user = await sharedPreference.getUser();
      setBusy = false;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  void toggleDarkMode() {
    if (!isDarkMode) {
      Get.changeTheme(MyThemes.dark);
      isDarkMode = true;
    } else {
      Get.changeTheme(MyThemes.light);
      isDarkMode = false;
    }
    notifyListeners();
  }
}
