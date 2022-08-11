import 'package:flutter/material.dart';
import 'package:flutter_shoe_app/extensions/double_extension.dart';
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
    return (quantity * shoe.price!).toCurrencyFormat();
  }

//My Likes implementation
  List<Shoe> myLikes = []; //store items that are liked

  void addToMyLikes(Shoe shoe) {
    myLikes.add(shoe);
    notifyListeners();
    shoe.isLiked = true;
    notifyListeners();
  }

  void removeFromLikes(Shoe shoe) {
    shoe.isLiked = false;
    myLikes.remove(shoe);
    notifyListeners();
  }

  void onShoeLikePressed(Shoe shoe) {
    if (shoe.isLiked) {
      removeFromLikes(shoe);
    } else {
      addToMyLikes(shoe);
    }
  }
}
