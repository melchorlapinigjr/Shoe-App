import 'package:flutter/material.dart';
import 'package:flutter_shoe_app/views/add_shoe/add_shoe_view_model.dart';
import 'package:flutter_shoe_app/views/widgets/show_sizes_view.dart';
import 'package:stacked/stacked.dart';

import 'add_shoe_image_view.dart';

class AddShoeView extends StatefulWidget {
  const AddShoeView({Key? key}) : super(key: key);

  @override
  State<AddShoeView> createState() => _AddShoeViewState();
}

class _AddShoeViewState extends State<AddShoeView> {
  TextEditingController nameController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

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
            body: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Padding(padding: EdgeInsets.fromLTRB(8, 31, 8, 8)),
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
                          controller: nameController,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(8, 0, 8, 5),
                            hintText: "Name",
                            hintStyle: TextStyle(
                              fontSize: 16,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      )),
                      const Padding(padding: EdgeInsets.fromLTRB(8, 32, 8, 8)),
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
                          controller: descriptionController,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(8, 0, 8, 8),
                            hintText: "Description",
                            hintStyle: TextStyle(
                              fontSize: 16,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      )),
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
                      ShowSizesView(
                        selectedSizes: viewModel.selectedSizes,
                        onSizeSelectedCallback:
                            viewModel.onSizeSelectedCallback,
                        availableSizes: ALL_SHOE_SIZES,
                      )
                    ],
                  ),
                ),
              ],
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
                    //viewModel.uploadNew(viewModel.shoeImages);
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
