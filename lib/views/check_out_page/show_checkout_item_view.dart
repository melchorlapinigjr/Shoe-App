import 'package:flutter/material.dart';
import 'package:flutter_shoe_app/views/application/application_view_model.dart';
import 'package:flutter_shoe_app/views/check_out_page/checkout_item_view.dart';
import 'package:stacked/stacked.dart';

class ShowCheckOutItemView extends StatelessWidget {
  const ShowCheckOutItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ApplicationViewModel>.reactive(
        disposeViewModel: false,
        onModelReady: (model) => model.getMyCart(),
        viewModelBuilder: () => ApplicationViewModel(),
        builder: (context, viewModel, child) {
          return SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: viewModel.cart.length,
                  itemBuilder: (BuildContext context, int index) {
                    final shoe = viewModel.cart.keys.toList()[index];
                    final quantity = viewModel.cart[shoe] ?? 0;
                    return CheckOutItemView(
                      shoe: shoe,
                      quantity: quantity,
                    );
                  },
                ),
              ],
            ),
          );
        });
  }
}
