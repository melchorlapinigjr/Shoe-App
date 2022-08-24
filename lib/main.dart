import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_shoe_app/app/app.locator.dart';
import 'package:flutter_shoe_app/app/app.router.dart';
import 'package:flutter_shoe_app/views/application/application_view_model.dart';
import 'package:flutter_shoe_app/views/home/homepage_view.dart';
import 'package:flutter_shoe_app/views/login/log_in_view.dart';
import 'package:flutter_shoe_app/views/widgets/circular_%20progress.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

import 'core/services/navigation/navigation_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
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
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: locator<NavigationService>().navigatorKey,
      title: 'Shoe App',
    ));
  });
}
