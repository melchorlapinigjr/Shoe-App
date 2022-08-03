import 'package:flutter/material.dart';
import 'package:flutter_shoe_app/extensions/double_extension.dart';
import 'package:flutter_shoe_app/views/home/shoe_object.dart';

class ApplicationViewModel extends ChangeNotifier {
  static List<Shoe> items = [
    Shoe(
      image: 'lib/resources/assets/images/alpha_savage.png',
      title: 'Alpha Savage',
      price: 8995,
      backgroundColor: Colors.red,
      titleColor: Colors.white,
    ),
    Shoe(
      image: 'lib/resources/assets/images/air_max_97.png',
      title: 'Air Max 97',
      price: 11897,
      backgroundColor: Colors.yellow,
      titleColor: const Color(0xff1F2732),
    ),
    Shoe(
      image: 'lib/resources/assets/images/kd_13_ep.png',
      title: 'KD 13 EP',
      price: 12995,
      backgroundColor: Colors.blue,
      titleColor: Colors.white,
    ),
    Shoe(
      image: 'lib/resources/assets/images/undercover_react_presto.png',
      title: 'Undercover React Presto',
      price: 12797,
      backgroundColor: Colors.blue,
      titleColor: Colors.white,
    ),
    Shoe(
      image: 'lib/resources/assets/images/air_zoom_pegasus_37.png',
      title: 'Air Zoom Pegasus 37',
      price: 9995,
      backgroundColor: Colors.blue,
      titleColor: Colors.white,
    ),
  ];

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
    return (quantity * shoe.price).toCurrencyFormat();
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
