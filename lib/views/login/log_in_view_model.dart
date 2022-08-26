// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_shoe_app/app/app.router.dart';
import 'package:flutter_shoe_app/core/services/api/api_service.dart';
import 'package:flutter_shoe_app/core/services/navigation/navigation_service.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app/app.locator.dart';
import '../../core/services/api/api_service.dart';

class LoginViewModel extends ChangeNotifier {
  bool isObscure = true;
  //handle google signin
  final ApiService apiService = locator<ApiService>();
  bool isLogged = true;
  bool isBusy = false;
  final NavigationService navigationService = locator<NavigationService>();

  void changeObscure() {
    isObscure = isObscure == false ? true : false;
    notifyListeners();
  }

  Future<void> init() async {
    await isUserLoggedIn();
  }

  Future<void> isUserLoggedIn() async {
    isBusy = true;
    notifyListeners();
    isLogged = false;
    notifyListeners();
    final SharedPreferences sharedPreference =
        await SharedPreferences.getInstance();
    var user = sharedPreference.getString('userPrefKey');
    if (user != null) {
      isLogged = true;
      notifyListeners();
      await navigationService.pushReplacementNamed(Routes.HomepageView);
    }
    isBusy = false;
    notifyListeners();
  }

  Future<void> signInGoogle() async {
    try {
      await apiService.googleSignIn();
      navigationService.pushReplacementNamed(Routes.HomepageView);
    } catch (e) {
      // ScaffoldMessenger.of(Get.context!)
      //     .showSnackBar(SnackBar(content: Text(e.toString())));
      throw 'Logged Canceled by User';
    }
  }

  //facebook login
  Future<void> loginFacebook() async {
    isLogged = false;
    notifyListeners();
    try {
      await apiService.facebookLogin();
      navigationService.pushReplacementNamed(Routes.HomepageView);
    } catch (e) {
      rethrow;
    }
  }

  //login with fields
  TextEditingController emailFieldController = TextEditingController(),
      passwordFieldController = TextEditingController();

  Future<void> loginFields(String email, String password) async {
    try {
      await apiService.signInWithFields(email, password);
      navigationService.pushReplacementNamed(Routes.HomepageView);
    } catch (e) {
      //rethrow;
      showDialog(
          context: Get.context!,
          builder: (_) {
            return AlertDialog(
              title: const Text(
                'Invalid Login!',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                ),
              ),
              actions: [
                Center(
                  child: SizedBox(
                    height: 40,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                        const Color(0xff14FC24).withOpacity(0.7),
                      )),
                      onPressed: () {
                        navigationService.pop();
                      },
                      child: const Center(
                          child: Text(
                        'Got It!',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Color(0xff1F2732)),
                      )),
                    ),
                  ),
                ),
              ],
            );
          });
    }
  }
}
