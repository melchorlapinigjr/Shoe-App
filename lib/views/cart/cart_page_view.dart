import 'package:flutter/material.dart';
import 'package:flutter_shoe_app/app/app.locator.dart';
import 'package:flutter_shoe_app/app/app.router.dart';
import 'package:flutter_shoe_app/views/application/application_view_model.dart';
import 'package:flutter_shoe_app/views/cart/cart_item_view.dart';
import 'package:flutter_shoe_app/views/check_out_page/checkout_page_view.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class CartPageView extends StatelessWidget {
  const CartPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ApplicationViewModel applicationViewModel =
        locator<ApplicationViewModel>();
    return ViewModelBuilder<ApplicationViewModel>.reactive(
        disposeViewModel: false,
        onModelReady: (model) => model.getMyCart(),
        viewModelBuilder: () => ApplicationViewModel(),
        builder: (context, viewModel, child) {
          return viewModel.cart.isNotEmpty
              ? Container(
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
                          itemCount: viewModel.cart.length,
                          itemBuilder: (BuildContext context, int index) {
                            final shoe = viewModel.cart.keys.toList()[index];
                            final cartObject =
                                applicationViewModel.tempCart[index];
                            final quantity = viewModel.cart[shoe] ?? 0;
                            return CartItemView(
                              shoe: shoe,
                              quantity: quantity,
                              cartObject: cartObject,
                            );
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    const Color(0xff1F2732)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ))),
                            onPressed: () async {
                              await applicationViewModel.navigationService
                                  .pushNamed(Routes.Checkout);
                            },
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
                )
              : const Center(
                  child: Text('You have no items in cart'),
                );
        });
  }
}
