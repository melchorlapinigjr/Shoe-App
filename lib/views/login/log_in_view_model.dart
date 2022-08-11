import 'package:flutter/material.dart';
import 'package:flutter_shoe_app/core/services/api/api_service.dart';

import '../../app/app.locator.dart';
import 'package:flutter_shoe_app/app/app.router.dart';
import 'package:flutter_shoe_app/core/services/navigation/navigation_service.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import '../../core/services/api/api_service.dart';
import '../application/application_view_model.dart';
import '../home/homepage_view.dart';

class LoginViewModel extends ChangeNotifier {
  bool isObscure = true;

  final NavigationService navigationService = locator<NavigationService>();

  void changeObscure() {
    isObscure = isObscure == false ? true : false;
    notifyListeners();
  }

  //handle google signin
  final ApiService apiService = locator<ApiService>();
  bool isLogged = false;

  Future<void> signInGoogle(BuildContext context) async {
    isLogged = false;
    notifyListeners();
    try {
      await apiService.googleSignIn();
      // toHomepage();
      // ignore: use_build_context_synchronously
      Navigator.push(context, MaterialPageRoute(builder: (_) {
        return ViewModelBuilder<ApplicationViewModel>.reactive(
            disposeViewModel: false,
            viewModelBuilder: () => Provider.of<ApplicationViewModel>(context),
            builder: (context, viewModel, child) {
              return const HomepageView();
            });
      }));
    } catch (e) {
      print(e);
    }
    print("islogged: ${isLogged}");
    isLogged = true;
    notifyListeners();
  }

  //route to homepage
  Future<void> toHomepage() async {
    await navigationService.pushNamed(Routes.HomepageView);
  }

  Future<void> loginFacebook(BuildContext context) async {
    isLogged = false;
    notifyListeners();
    try {
      await apiService.facebookLogin();
      // toHomepage();
      // ignore: use_build_context_synchronously
      Navigator.push(context, MaterialPageRoute(builder: (_) {
        return ViewModelBuilder<ApplicationViewModel>.reactive(
            disposeViewModel: false,
            viewModelBuilder: () => Provider.of<ApplicationViewModel>(context),
            builder: (context, viewModel, child) {
              return const HomepageView();
            });
      }));
    } catch (e) {
      print(e);
    }
    print("islogged: ${isLogged}");
    isLogged = true;
    notifyListeners();
  }
}
