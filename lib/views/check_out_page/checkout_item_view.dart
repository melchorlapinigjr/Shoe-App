import 'package:flutter/material.dart';
import 'package:flutter_shoe_app/models/shoe_object.dart';
import 'package:flutter_shoe_app/views/application/application_view_model.dart';
import 'package:flutter_shoe_app/views/check_out_page/checkout_item_view_model.dart';
import 'package:stacked/stacked.dart';

class CheckOutItemView extends StatelessWidget {
  const CheckOutItemView({
    Key? key,
    required this.shoe,
    required this.quantity,
  }) : super(key: key);

  final Shoe shoe;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CheckOutItemViewModel>.reactive(
        disposeViewModel: false,
        viewModelBuilder: () => CheckOutItemViewModel(shoe),
        builder: (context, viewModel, child) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: <Widget>[
                    Column(
                      children: [
                        ClipRect(
                          child: Image.network(
                            shoe.images![0],
                            width: 127.93,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text('Number of items: '),
                            Center(
                                child: Text(
                              viewModel.applicationViewModel.cart[shoe]
                                  .toString(),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 32,
                    ),
                    Flexible(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              shoe.name ?? "",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                overflow: TextOverflow.clip,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              ApplicationViewModel().getTotalPrice(shoe),
                              style: TextStyle(
                                color: const Color(0xff1F2732).withOpacity(0.5),
                              ),
                            ),
                          ]),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                        onPressed: () async {
                          viewModel.checkOutItem(shoe);
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.green),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ))),
                        child: const Text(
                          'Submit',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        )))
              ],
            ),
          );
        });
  }
}
