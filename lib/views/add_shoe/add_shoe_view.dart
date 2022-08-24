import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_shoe_app/app/app.router.dart';
import 'package:flutter_shoe_app/views/add_shoe/add_shoe_view_model.dart';
import 'package:flutter_shoe_app/views/application/application_view_model.dart';
import 'package:flutter_shoe_app/views/home/homepage_view.dart';
import 'package:flutter_shoe_app/views/widgets/show_sizes_view.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

import 'add_shoe_image_view.dart';

class AddShoeView extends StatelessWidget with InputValidationMixin {
  AddShoeView({Key? key}) : super(key: key);
  final formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddShoeViewModel>.reactive(
        viewModelBuilder: () => AddShoeViewModel(),
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Add Shoe',
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
              elevation: 0,
              backgroundColor: Colors.white,
              iconTheme: const IconThemeData(
                color: Colors.black,
              ),
            ),
            body: Form(
              key: formGlobalKey,
              autovalidateMode: AutovalidateMode.always,
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const Padding(
                            padding: EdgeInsets.fromLTRB(8, 25, 8, 8)),
                        Center(
                            child: Container(
                          width: 320,
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black12,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextFormField(
                            textAlign: TextAlign.start,
                            minLines: 1,
                            maxLines: 3,
                            keyboardType: TextInputType.multiline,
                            controller: viewModel.nameController,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(8, 0, 8, 5),
                              labelText: "Name*",
                              hintStyle: TextStyle(
                                fontSize: 16,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                              ),
                              border: InputBorder.none,
                            ),
                            // onChanged: (String? value) => {
                            //   print('Shoe Name: "$value"')
                            // },
                            validator: (name) {
                              if (isName(name!)) {
                                return null;
                              } else {
                                return 'Enter the shoe name';
                              }
                            },
                          ),
                        )),
                        const Padding(
                            padding: EdgeInsets.fromLTRB(8, 20, 8, 8)),
                        Center(
                            child: Container(
                          width: 320,
                          height: 110,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black12,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextFormField(
                            textAlign: TextAlign.start,
                            minLines: 1,
                            maxLines: 10,
                            keyboardType: TextInputType.multiline,
                            controller: viewModel.descriptionController,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(8, 0, 8, 8),
                              labelText: "Description*",
                              hintStyle: TextStyle(
                                fontSize: 16,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                              ),
                              border: InputBorder.none,
                            ),
                            // onChanged: (String? value) =>
                            // {print('Description: "$value"')},
                            validator: (description) {
                              if (isDescription(description!)) {
                                return null;
                              } else {
                                return 'Enter the description of the shoe';
                              }
                            },
                          ),
                        )),
                        const Padding(padding: EdgeInsets.fromLTRB(8, 0, 8, 8)),
                        Center(
                          child: TextFormField(
                            textAlign: TextAlign.start,
                            decoration: const InputDecoration(
                                labelText: 'Price in Php*',
                                hintText: '0.00',
                                hintStyle: TextStyle(
                                  fontSize: 16,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black26,
                                  ),
                                )),
                            controller: viewModel.priceController,
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp('[0-9.,]+')),
                            ],
                            onChanged: (value) => double.parse(value),
                            validator: (price) {
                              if (isPriceValid(price!)) {
                                return null;
                              } else {
                                return 'Enter a valid price format';
                              }
                            },
                          ),
                        ),
                        const Padding(
                            padding: EdgeInsets.fromLTRB(8, 0, 8, 12)),
                        Center(
                          child: TextFormField(
                            textAlign: TextAlign.start,
                            minLines: 1,
                            maxLines: 10,
                            keyboardType: TextInputType.multiline,
                            controller: viewModel.categoryController,
                            decoration: const InputDecoration(
                                //contentPadding: EdgeInsets.fromLTRB(8, 0, 8, 8),
                                labelText: 'Category*',
                                hintText:
                                    " Lifestyle, Jordan, Outdoor, Fashion, Casual, Sports ",
                                hintStyle: TextStyle(
                                  fontSize: 12,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black26,
                                  ),
                                )),
                            // onChanged: (String? value) =>
                            // {print('Category: "$value"')},
                            validator: (category) {
                              if (isCategory(category!)) {
                                return null;
                              } else {
                                return 'Enter a Category';
                              }
                            },
                          ),
                        ),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.only(top: 16),
                            child: Text(
                              "Images",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        const Align(
                            alignment: Alignment.centerLeft,
                            child: AddShoeImageView()),
                        AddShoeSizesView(
                          selectedSizes: viewModel.selectedSizes,
                          onSizeSelectedCallback:
                              viewModel.onSizeSelectedCallback,
                          availableSizes: addshoesizes,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: Container(
                margin: const EdgeInsets.fromLTRB(24, 16, 24, 6),
                height: 48,
                width: 312,
                color: Colors.white.withOpacity(0.9),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xFF1F2732)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ))),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (_) {
                          return AlertDialog(
                            title: const Text(
                              'New product will be added.',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                            content: const Text('Continue?'),
                            actions: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    height: 40,
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                        Colors.redAccent,
                                      )),
                                      onPressed: () {
                                       viewModel.navigationService.pop();
                                      },
                                      child: const Center(
                                          child: Text(
                                        'Cancel',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                        ),
                                      )),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  SizedBox(
                                    height: 40,
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                        Colors.lightBlue,
                                      )),
                                      onPressed: () async {
                                        viewModel.addShoe(
                                          context,
                                          viewModel.nameController.text,
                                          viewModel.descriptionController.text,
                                          double.parse(
                                              viewModel.priceController.text),
                                          viewModel.base64String,
                                          viewModel.selectedSizes,
                                          viewModel.categoryController.text,
                                        );
                                       viewModel.navigationService.pushReplacementNamed(Routes.HomepageView);
                                      },
                                      child: const Center(
                                          child: Text(
                                        'OK',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                        ),
                                      )),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        });
                  },
                  child: const Text('Add',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                      textAlign: TextAlign.center),
                )),
          );
        });
  }
}

mixin InputValidationMixin {
  bool isPriceValid(String price) {
    final pattern = RegExp("^[1-9]d*(.d+)?");
    return pattern.hasMatch(price);
  }

  bool isDescription(String description) {
    return description.isNotEmpty;
  }

  bool isName(String name) {
    return name.isNotEmpty;
  }

  bool isCategory(String category) {
    return category.isNotEmpty;
  }
}
