import 'package:flutter_shoe_app/core/services/api/api_service.dart';
import 'package:flutter_shoe_app/core/services/api/api_service_impl.dart';
import 'package:flutter_shoe_app/core/services/navigation/navigation_service.dart';
import 'package:flutter_shoe_app/core/services/navigation/navigation_service_impl.dart';
import 'package:flutter_shoe_app/views/login/log_in_view.dart';
import 'package:stacked/stacked_annotations.dart';

@StackedApp(
  routes: [
    AdaptiveRoute(page: LoginView, name: "LoginView", initial: true),
  ],
  dependencies: [
    LazySingleton(classType: ApiServiceImpl, asType: ApiService),
    LazySingleton(classType: NavigationServiceImpl, asType: NavigationService),
  ],
)
class App {}
