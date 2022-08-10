import 'package:flutter/material.dart';
import 'package:flutter_shoe_app/app/app.locator.dart';
import 'package:flutter_shoe_app/core/services/api/api_service.dart';
import 'package:flutter_shoe_app/models/user_object.dart';
import 'package:image_picker/image_picker.dart';

class LoginViewModel extends ChangeNotifier {
  bool isObscure = true;

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


}
