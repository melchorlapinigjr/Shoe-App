import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_shoe_app/app/app.locator.dart';
import 'package:flutter_shoe_app/app/app.router.dart';
import 'package:flutter_shoe_app/views/widgets/network_connectivity.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'core/services/navigation/navigation_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  networkConnectivity();
}

Future<void> networkConnectivity() async {
  // Check internet connection with singleton (no custom values allowed)
  await execute(InternetConnectionChecker());
  // Create customized instance which can be registered via dependency injection
  // final InternetConnectionChecker customInstance =
  // InternetConnectionChecker.createInstance(
  //   checkTimeout: const Duration(seconds: 1),
  //   checkInterval: const Duration(seconds: 1),
  // );
  //
  // // Check internet connection with created instance
  // await execute(customInstance);
}

Future<void> execute(
  InternetConnectionChecker internetConnectionChecker,
) async {
  // Simple check to see if we have Internet
  // ignore: avoid_print
  // print('''The statement 'this machine is connected to the Internet' is: ''');
  final bool isConnected = await InternetConnectionChecker().hasConnection;
  //final NavigationService nav = locator<NavigationService>();
  // ignore: avoid_print
  // print(
  //   isConnected.toString(),
  // );
  // returns a bool

  // We can also get an enum instead of a bool
  // ignore: avoid_print
  print(
    'Current status: ${await InternetConnectionChecker().connectionStatus}',
  );
  // Prints either InternetConnectionStatus.connected
  // or InternetConnectionStatus.disconnected

  // actively listen for status updates
  final StreamSubscription<InternetConnectionStatus> listener =
      InternetConnectionChecker().onStatusChange.listen(
    (InternetConnectionStatus status) {
      switch (status) {
        case InternetConnectionStatus.connected:
          // ignore: avoid_print
          print('Data connection is available.');
          displayApp("connected");
          break;
        case InternetConnectionStatus.disconnected:
          // ignore: avoid_print
          //await nav.pushReplacementNamed(Routes.Network);
          //NetworkConnectivity();
          print('You are disconnected from the internet.');
          displayApp("disconnected");
          break;
      }
    },
  );
  //NetworkConnectivity();
  // close listener after 30 seconds, so the program doesn't run forever
  await Future<void>.delayed(const Duration(seconds: 30));
  await listener.cancel();
}

void displayApp(String status) {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  //Get.put(MyAppController());
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) async {
    runApp(status == "connected" ? GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Avalon',
        canvasColor: Colors.white,
        backgroundColor: Colors.white,
      ),
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: locator<NavigationService>().navigatorKey,
      title: "Shoe App",
    ) : NetworkConnectivity()
    );
  });
}

void noInternet() {
  WidgetsFlutterBinding.ensureInitialized();
  //setupLocator();
  //Get.put(MyAppController());
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) async {
    runApp(GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Avalon',
        canvasColor: Colors.white,
        backgroundColor: Colors.white,
      ),
      //onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: locator<NavigationService>().navigatorKey,
      // title: "Shoe App",
    ));

    NetworkConnectivity();
  });
  // AlertDialog(
  //   title: Text('No Internet'),
  //   content: Text('Check your connections'),
  // );
}
