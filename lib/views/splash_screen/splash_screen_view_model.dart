import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shoe_app/app/app.locator.dart';
import 'package:flutter_shoe_app/app/app.router.dart';
import 'package:flutter_shoe_app/core/services/navigation/navigation_service.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

final NavigationService navigationService = locator<NavigationService>();

@LazySingleton()
class SplashScreenViewModel extends BaseViewModel {
  //ConnectivityResult? connectivityResult;
  late StreamSubscription connectivitySubscription;
  bool isConnected = false;
  bool isAlertSet = false;
  

  void init() async {
    await Future.delayed(const Duration(seconds: 6));
    navigationService.pushReplacementNamed(Routes.LoginView);
    notifyListeners();
  }


  void disposeStreams() {
    connectivitySubscription.cancel();
  }

  void checkConnectivityState() async {
    connectivitySubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async {
      isConnected = await InternetConnectionChecker().hasConnection;
      if (!isConnected && isAlertSet == false) {
        dialogBox();
        isAlertSet = true;
        notifyListeners();
      }
    });
  }

  dialogBox() => showDialog(
      context: Get.context!,
      barrierDismissible: false,
      useSafeArea: true,
      builder: (_) {
        return AlertDialog(
          title: const Text(
            'Network error!',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 24,
            ),
          ),
          actions: [
            Center(
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black45,
                ),
                onPressed: () async {
                  navigationService.pop();
                  isAlertSet = false;
                  notifyListeners();
                  isConnected = await InternetConnectionChecker().hasConnection;
                  if (!isConnected && isAlertSet == false) {
                    dialogBox();
                    isAlertSet = true;
                    notifyListeners();
                  }
                },
                child: const Text(
                  'Refresh',
                ),
              ),
            ),
          ],
        );
      });
}
