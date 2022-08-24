import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_shoe_app/app/app.locator.dart';
import 'package:flutter_shoe_app/core/services/navigation/navigation_service.dart';
import 'package:flutter_shoe_app/models/shoe_object.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/services/api/api_service.dart';

class AddShoeViewModel extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController categoryController = TextEditingController();

  final ApiService apiService = locator<ApiService>();
  final imagePicker = ImagePicker();
  final NavigationService navigationService = locator<NavigationService>();

  String imagePath = "";
  List<XFile>? images = [];
  List<String> selectedSizes = [];
  List<String> base64String = [];

  Future getImages() async {
    List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages != null && selectedImages.isNotEmpty) {
      for (int i = 0; i < selectedImages.length; i++) {
        File imageFile = File(selectedImages[i].path);
        imagePath = imageFile.path;
        //final String jsonImage = jsonEncode(imagePath);
        //print(jsonImage);

        File imagefile = File(imagePath); //convert Path to File
        Uint8List imagebytes = await imagefile.readAsBytes(); //convert to bytes

        String base64img =
            'data:image/png;base64,${base64.encode(imagebytes)}'; //convert bytes to base64 string
        //print(base64img);

        base64String.add(base64img);

        // for (String s in base64String) {
        //   print(s);
        // }
      }
      images!.addAll(selectedImages);
    } else {
      print('No images Selected');
    }
    // else {
    //   print('No images Selected');
    // }
    notifyListeners();
  }

  void onSizeSelectedCallback(List<String> values) {
    selectedSizes = values;
    //print(selectedSizes);
    notifyListeners();
  }

  //adding new shoe item
  Future<void> addShoe(
    BuildContext context,
    String name,
    String description,
    double price,
    List<String> images,
    List<String> sizes,
    String category,
  ) async {
    try {
      await apiService.addShoeItem(Shoe(
        name: name,
        description: description,
        price: price,
        images: images,
        sizes: sizes,
        category: category,
      ));
      ScaffoldMessenger.of(Get.context!).showSnackBar(
          const SnackBar(content: Text('Shoe has been added successfully!')));
    } catch (e) {
      print(e);
    }
  }
}
