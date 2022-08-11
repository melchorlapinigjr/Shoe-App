import 'package:flutter/material.dart';
import 'package:flutter_shoe_app/app/app.locator.dart';
import 'package:flutter_shoe_app/core/services/api/api_service.dart';
import 'package:flutter_shoe_app/models/user_object.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_shoe_app/app/app.router.dart';
import 'package:flutter_shoe_app/core/services/navigation/navigation_service.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

import '../../app/app.locator.dart';
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

  //register
  final ApiService apiService = locator<ApiService>();

  final nameFieldController = TextEditingController();
  final emailFieldController = TextEditingController();
  final passFieldController = TextEditingController();

  Future<void> onRegister(String name, String email, String password)async {
    print('name: $User().name');
    await apiService.getLoginRegister(name, email, password);
  }
  final imagePicker = ImagePicker();
  XFile? image;
  bool isImageLoaded =false;

  List<String> selectedSizes = [];

  Future getImages() async {
    XFile? selectedImage = await imagePicker.pickImage(source: ImageSource.gallery);
    if (selectedImage != null) {
      image=selectedImage;
      isImageLoaded=true;
    }
    // else {
    //   print('No images Selected');
    // }
    notifyListeners();
  }
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

}
