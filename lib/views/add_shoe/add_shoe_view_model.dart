import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_shoe_app/app/app.locator.dart';
import 'package:flutter_shoe_app/core/services/api/api_service.dart';
import 'package:image_picker/image_picker.dart';

class AddShoeViewModel extends ChangeNotifier {
  final ApiService apiService = locator<ApiService>();
  final imagePicker = ImagePicker();
  List<XFile>? images = [];
  String imagePath = "";
  List<String> selectedSizes = [];
  List<String> shoeImages = [];

  Future getImages() async {
    List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages != null && selectedImages.isNotEmpty == true) {
      images!.addAll(selectedImages);
      if (selectedImages != null && selectedImages.isNotEmpty) {
        for (int i = 0; i < selectedImages.length; i++) {
          File imageFile = File(selectedImages[i].path);
          imagePath = imageFile.path;
          final jsonImage = jsonEncode(imagePath);
          print('jsonImage : $jsonImage');
          imageFile = File(imagePath); //seeks file from filePath
          Uint8List imageBytes = await imageFile.readAsBytes();

          shoeImages.add('data:image/jpeg;base64,${base64.encode(imageBytes)}');
          print('shoeImages: $shoeImages');
        }
      }
    }
    // else {
    //   print('No images Selected');
    // }
    notifyListeners();
  }

  // Future<void> uploadNew(List<String> imgs) async {
  //   await apiService.newProduct(imgs);
  // }

  void onSizeSelectedCallback(List<String> values) {
    selectedSizes = values;
    notifyListeners();
  }
}
