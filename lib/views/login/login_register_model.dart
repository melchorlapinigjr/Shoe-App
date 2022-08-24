import 'package:flutter/material.dart';
import 'package:flutter_shoe_app/app/app.locator.dart';
import 'package:flutter_shoe_app/core/services/api/api_service.dart';
import 'package:flutter_shoe_app/core/services/navigation/navigation_service.dart';
import 'package:flutter_shoe_app/models/user_object.dart';
import 'package:image_picker/image_picker.dart';

class LoginRegisterModel extends ChangeNotifier {
  //register
  final ApiService apiService = locator<ApiService>();
  final NavigationService navigationService = locator<NavigationService>();
  final nameFieldController = TextEditingController();
  final emailFieldController = TextEditingController();
  final passFieldController = TextEditingController();
  final imagePicker = ImagePicker();
  XFile? image;
  bool isImageLoaded = false;

  List<String> selectedSizes = [];

  Future getImages() async {
    XFile? selectedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (selectedImage != null) {
      image = selectedImage;
      isImageLoaded = true;
    }
    // else {
    //   print('No images Selected');
    // }
    notifyListeners();
  }

  bool isObscure = true;
  void changeObscure() {
    isObscure = isObscure == false ? true : false;
    notifyListeners();
  }

  Future<void> onRegister(String name, String email, String password) async {
    print('name: $name, email: $email, password: $password');
    try {
      await apiService
          .registerUser(User(name: name, email: email, password: password));
    } catch (e) {
      print(e);
    }
  }
}
