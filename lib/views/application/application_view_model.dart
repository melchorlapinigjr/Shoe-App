import 'package:flutter/material.dart';
import 'package:flutter_shoe_app/app/app.locator.dart';
import 'package:flutter_shoe_app/core/services/api/api_service.dart';
import 'package:flutter_shoe_app/core/services/shared_preferrence/shared_preference.dart';
import 'package:flutter_shoe_app/extensions/double_extension.dart';
import 'package:flutter_shoe_app/models/shoe_object.dart';
import 'package:flutter_shoe_app/models/user_object.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked_annotations.dart';

@LazySingleton()
class ApplicationViewModel extends ChangeNotifier {
  final ApiService apiService = locator<ApiService>();
  User? user;
  final SharedPreference sharedPreference = locator<SharedPreference>();
  List<Shoe> wishlist = [];

  // int = quantity
  Map<Shoe, int> cart = {};
  Map<Shoe, bool> myWishlist = {};

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

  Future<void> getMyLikes() async {
    try {
      user = await sharedPreference.getUser();
      if (user!.id != null) {
        final wishlists = await apiService.getMyLikes(user!.id!);
        wishlist.clear();
        myWishlist.clear();
        wishlist.addAll(wishlists);
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
        await apiService.removeFromLikes(shoe);
        ScaffoldMessenger.of(Get.context!).showSnackBar(
            const SnackBar(content: Text('Removed from your likes')));
      } catch (e) {
        rethrow;
      }
    }
    notifyListeners();
  }
}
