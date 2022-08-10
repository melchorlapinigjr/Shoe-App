import 'package:flutter/foundation.dart';
import 'package:flutter_shoe_app/app/app.locator.dart';
import 'package:flutter_shoe_app/core/services/api/api_service.dart';
import 'package:flutter_shoe_app/core/services/shared_preferrence/shared_preference.dart';
import 'package:flutter_shoe_app/models/user_object.dart';

class ProfilePageViewModel extends ChangeNotifier {
  final ApiService apiService = locator<ApiService>();
  final SharedPreference sharedPreference = locator<SharedPreference>();

  User? user;

  bool setBusy = false;

  Future<void> initialize() async {
    setBusy = true;
    notifyListeners();
    try {
      user = await sharedPreference.getUser();
      setBusy = false;
      notifyListeners();
    } catch (e, stackTrace) {
      print((stackTrace));
    }
  }
}
