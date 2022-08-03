import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddShoeViewModel extends ChangeNotifier {
  final imagePicker = ImagePicker();
  List<XFile>? images = [];

  List<String> selectedSizes = [];

  Future getImages() async {
    List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages != null && selectedImages.isNotEmpty == true) {
      images!.addAll(selectedImages);
    }
    // else {
    //   print('No images Selected');
    // }
    notifyListeners();
  }

  void onSizeSelectedCallback(List<String> values) {
    selectedSizes = values;
    notifyListeners();
  }
}
