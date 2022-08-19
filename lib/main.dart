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
    final SharedPreferences sharedPreference =
        await SharedPreferences.getInstance();
    var user = sharedPreference.getString('userPrefKey');
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
      home: ViewModelBuilder<ApplicationViewModel>.reactive(
        builder: (context, model, child) {
          return user == null ? const LoginView() : HomepageView();
        },
        viewModelBuilder: () => ApplicationViewModel(),
        disposeViewModel: false,
      ),
    ));

    //runApp(const MyApp());
  });
}

class MyApp extends GetView<MyAppController> {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx((state) {
      return GetBuilder<MyAppController>(builder: (controller) {
        return GetMaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.blue,
            fontFamily: 'Avalon',
            canvasColor: Colors.white,
            backgroundColor: Colors.white,
          ),
          onGenerateRoute: StackedRouter().onGenerateRoute,
          navigatorKey: locator<NavigationService>().navigatorKey,
          title: 'Shoe App',
          home: ViewModelBuilder<ApplicationViewModel>.reactive(
            builder: (context, model, child) {
              return controller.userKey == null
                  ? const LoginView()
                  : const HomepageView();
            },
            viewModelBuilder: () => ApplicationViewModel(),
            disposeViewModel: false,
          ),
        );
      });
    }, onLoading: CircularProgress());
  }
}

class MyAppController extends GetxController with StateMixin {
  String? userKey;

  getData() async {
    // make status to loading
    change(null, status: RxStatus.loading());

    final SharedPreferences sharedPreference =
        await SharedPreferences.getInstance();
    // Code to get data
    userKey = sharedPreference.getString('userPrefKey');

    // if done, change status to success
    change(null, status: RxStatus.success());
  }
}
