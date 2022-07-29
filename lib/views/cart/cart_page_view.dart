import 'package:flutter/material.dart';
import 'package:flutter_shoe_app/views/application/application_view_model.dart';
import 'package:flutter_shoe_app/views/cart/cart_item_view.dart';
import 'package:stacked/stacked.dart';
import 'package:provider/provider.dart';

class CartPageView extends StatelessWidget {
  const CartPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final applicationViewModel = Provider.of<ApplicationViewModel>(context);
    return ViewModelBuilder<ApplicationViewModel>.reactive(
        viewModelBuilder: () => applicationViewModel,
        builder: (context, viewModel, child) {
          return Container(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: applicationViewModel.cart.length,
                    itemBuilder: (BuildContext context, int index) {
                      final shoe =
                          applicationViewModel.cart.keys.toList()[index];
                      final quantity = applicationViewModel.cart[shoe] ?? 0;
                      return CartItemView(
                        shoe: shoe,
                        quantity: quantity,
                      );
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xff1F2732)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ))),
                      onPressed: () {},
                      child: const Text('Checkout',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                          textAlign: TextAlign.center),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
