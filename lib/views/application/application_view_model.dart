import 'package:flutter/material.dart';
import 'package:flutter_shoe_app/views/home/shoe_object.dart';

class ApplicationViewModel extends ChangeNotifier {
  // int = quantity
  Map<Shoe, int> cart = {};

  void addToCart(Shoe shoe) {
    cart[shoe] = (cart[shoe] ?? 0) + 1;
    notifyListeners();
  }

  void removeFromCart(Shoe shoe) {
    if (cart[shoe] == 1) {
      // remove
      cart.remove(shoe);
    }
    if (cart[shoe] == null) {
      // do nothing
    } else {
      cart[shoe] = cart[shoe]! - 1;
    }
    notifyListeners();
  }

  String getTotalPrice(Shoe shoe) {
    final quantity = cart[shoe] ?? 1;
    final price = 100;
    return '\$${quantity * price}';
  }
}
