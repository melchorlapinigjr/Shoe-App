import 'package:flutter/material.dart';
import 'package:flutter_shoe_app/app/app.locator.dart';
import 'package:flutter_shoe_app/core/services/api/api_service.dart';
import 'package:flutter_shoe_app/core/services/navigation/navigation_service.dart';
import 'package:flutter_shoe_app/core/services/shared_preferrence/shared_preference.dart';
import 'package:flutter_shoe_app/extensions/double_extension.dart';
import 'package:flutter_shoe_app/models/cart_object.dart';
import 'package:flutter_shoe_app/models/shoe_object.dart';
import 'package:flutter_shoe_app/models/user_object.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked_annotations.dart';

@LazySingleton()
class ApplicationViewModel extends ChangeNotifier {
  final NavigationService navigationService = locator<NavigationService>();
  final ApiService apiService = locator<ApiService>();
  User? user;
  final SharedPreference sharedPreference = locator<SharedPreference>();
  List<Shoe> wishlist = [];
  List<CartObject> tempCart = [];
  // int = quantity
  Map<Shoe, int> cart = {};
  Map<Shoe, bool> myWishlist = {};
  //check if resources wishlist page is loaded
  bool isWishlistInitialized = false;

  ///***************BEGIN CART***********************/
  //add shoe to cart
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

  double getCartTotalPrice(Shoe shoe) {
    final quantity = cart[shoe] ?? 1;
    return quantity * shoe.price!;
  }

  Future<void> getMyCart() async {
    try {
      user = await sharedPreference.getUser();
      if (user != null) {
        tempCart.clear();
        try {
          tempCart = await apiService.myCart(user!);
          notifyListeners();
          cart.clear();
          Map<Shoe, int> map = {};
          for (CartObject cartObject in tempCart) {
            map.addAll({cartObject.shoe as Shoe: cartObject.quantity!});
          }
          cart.addAll(map);
          notifyListeners();
        } catch (e) {
          rethrow;
        }
      }
    } catch (e) {
      rethrow;
    }
    notifyListeners();
  }

  ///***************END CART***********************/

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

  Future<void> getMyLikes() async {
    try {
      user = await sharedPreference.getUser();
      if (user!.id != null) {
        final tempWishlists = await apiService.getMyLikes(user!.id!);
        wishlist.clear();
        myWishlist.clear();
        wishlist.addAll(tempWishlists);
        Map<Shoe, bool> map = {};
        for (Shoe shoe in wishlist) {
          map.addAll({shoe: true});
        }
        myWishlist.addAll(map);
      }
    } catch (e) {
      rethrow;
    }
    notifyListeners();
  }

  Future<void> initializeWishlist() async {
    isWishlistInitialized = false;
    notifyListeners();
    try {
      await getMyLikes();
      isWishlistInitialized = true;
    } catch (e) {
      rethrow;
    }
    isWishlistInitialized = true;
    notifyListeners();
  }

  Future<void> isLiked(Shoe shoe) async {
    if (myWishlist[shoe] == false || myWishlist[shoe] == null) {
      myWishlist[shoe] = true;
      try {
        if (user!.id != null) {
          await apiService.addToLikes(user!, shoe);
          ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(
              content: Text('Successfully added to your likes')));
        }
      } catch (e) {
        rethrow;
      }
    } else {
      myWishlist[shoe] = false;
      try {
        if (user!.id != null) {
          await apiService.removeFromLikes(shoe, user!);
          ScaffoldMessenger.of(Get.context!).showSnackBar(
              const SnackBar(content: Text('Removed from your likes')));
        }
      } catch (e) {
        rethrow;
      }
    }
    notifyListeners();
  }
}
