import 'package:flutter/material.dart';
import 'package:flutter_shoe_app/app/app.locator.dart';
import 'package:flutter_shoe_app/views/application/application_view_model.dart';

class MyPurchasesViewModel extends ChangeNotifier{
  
  final ApplicationViewModel applicationViewModel = locator<ApplicationViewModel>();
  double price = 0;
  int quantity = 0;

  double getTotalCartPrice() {
    price = 0;
    quantity = 0;
    applicationViewModel.cart.forEach((key, value) {
      quantity += value;
      price += applicationViewModel.getCartTotalPrice(key);
    });
    return price ?? 0;
  }
}