import 'package:flutter/material.dart';
import 'package:flutter_shoe_app/views/application/application_view_model.dart';

class CartPageViewModel extends ChangeNotifier {
  double itemPrice = 9995;
  double totalItemPrice = 0;

  int itemCount = 1;
  ApplicationViewModel applicationViewModel;

  CartPageViewModel(this.applicationViewModel);

  void initialize() {
    totalItemPrice = itemPrice * itemCount;
    notifyListeners();
  }

  void addCount() {
    itemCount++;
    totalItemPrice = itemPrice * itemCount;
    notifyListeners();
  }

  void minusCount() {
    notifyListeners();
    if (itemCount == 1) {
      itemCount = 1;
      notifyListeners();
    } else {
      itemCount--;
      totalItemPrice = itemPrice * itemCount;
    }
    notifyListeners();
  }
}
