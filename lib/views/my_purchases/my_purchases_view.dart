// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:flutter_shoe_app/extensions/double_extension.dart';
import 'package:flutter_shoe_app/views/my_purchases/my_purchases_items.dart';
import 'package:flutter_shoe_app/views/my_purchases/my_purchases_view_model.dart';
import 'package:stacked/stacked.dart';

class MyPurchasesView extends StatelessWidget {
  const MyPurchasesView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MyPurchasesViewModel>.reactive(
        viewModelBuilder: () => MyPurchasesViewModel(),
        onModelReady: (model) => model.applicationViewModel.getMyCart(),
        disposeViewModel: false,
        builder: (context, viewModel, child) {
          viewModel.getTotalCartPrice();
          return Scaffold(
              appBar: AppBar(
                title: const Text(
                  "My Purchases",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                backgroundColor: Colors.white,
                elevation: 1,
                shadowColor: Colors.orange,
                iconTheme: const IconThemeData(
                  color: Colors.black,
                ),
              ),
              body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("To Pay",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            )),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 4,
                        ),
                        viewModel.applicationViewModel.cart.isNotEmpty
                            ? Container(
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 255, 234, 221),
                                ),
                                child: Column(
                                  children: [
                                    ListView.separated(
                                      primary: false,
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        final shoe = viewModel
                                            .applicationViewModel.cart.keys
                                            .toList()[index];
                                        final quantity = viewModel
                                                .applicationViewModel
                                                .cart[shoe] ??
                                            0;
                                        return MyPurchasesItems(shoe, quantity);
                                      },
                                      itemCount: viewModel
                                          .applicationViewModel.cart.length,
                                      separatorBuilder:
                                          (BuildContext context, int index) {
                                        return const Divider(
                                          height: 0,
                                          color: Colors.black38,
                                        );
                                      },
                                    ),
                                    const Divider(
                                      height: 0,
                                      color: Colors.black38,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(16),
                                      child: Row(
                                        // mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              viewModel.quantity == 1
                                                  ? '${viewModel.quantity} item'
                                                  : '${viewModel.quantity} items',
                                              style: TextStyle(
                                                color: const Color(0xff1F2732)
                                                    .withOpacity(0.3),
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                              'Order Total: ${viewModel.getTotalCartPrice().toCurrencyFormat()}',
                                              style: TextStyle(
                                                color: const Color(0xff1F2732)
                                                    .withOpacity(0.3),
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Divider(
                                      height: 0,
                                      color: Colors.black38,
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            right: 16, top: 8, bottom: 8),
                                        child: TextButton(
                                          style: TextButton.styleFrom(
                                            backgroundColor: Colors.black45,
                                          ),
                                          onPressed: () {},
                                          child: const Text(
                                            'Pending',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ],
                ),
              ));
        });
  }
}
