import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_shoe_app/views/add_shoe/add_shoe_view_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';

class AddShoeImageView extends ViewModelWidget<AddShoeViewModel> {
  const AddShoeImageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, AddShoeViewModel viewModel) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                viewModel.getImages();
                showDialog(
                    context: context,
                    builder: (_) {
                      return SingleChildScrollView(
                          child: Flexible(
                        child: AlertDialog(
                          title: Text(viewModel.shoeImages.toString()),
                        ),
                      ));
                    });
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 14.0),
                child: Container(
                  width: 72,
                  height: 64,
                  decoration: BoxDecoration(
                      color: const Color(0xFFD8D8D8),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.black.withOpacity(0.5),
                      )),
                  child: Icon(
                    Icons.photo,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
            ),
            for (XFile image in viewModel.images ?? []) ImageView(image.path),
          ],
        ),
      ),
    );
  }
}

class ImageView extends ViewModelWidget<AddShoeViewModel> {
  final String imagePath;

  const ImageView(this.imagePath, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, AddShoeViewModel viewModel) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Container(
              width: 72,
              height: 64,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: const Color(0xFFD8D8D8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.file(
                  File(imagePath),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
