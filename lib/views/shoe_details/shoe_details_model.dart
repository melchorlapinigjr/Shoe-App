import 'package:flutter/material.dart';
import 'package:flutter_shoe_app/app/app.locator.dart';
import 'package:flutter_shoe_app/core/services/api/api_service.dart';
import 'package:flutter_shoe_app/core/services/shared_preferrence/shared_preference.dart';
import 'package:flutter_shoe_app/models/cart_object.dart';
import 'package:flutter_shoe_app/models/user_object.dart';
import 'package:flutter_shoe_app/utils/palette_utils.dart';
import 'package:flutter_shoe_app/views/application/application_view_model.dart';
import 'package:flutter_shoe_app/views/widgets/show_sizes_view.dart';
import 'package:get/get.dart';

import '../../models/shoe_object.dart';

class ShoeDetailsModel extends ChangeNotifier {
  Shoe shoe;

  //wishlist
  bool liked;

  ShoeDetailsModel(this.shoe, this.liked);

  User? user;
  bool isBusy = false;
  final ApplicationViewModel applicationViewModel =
      locator<ApplicationViewModel>();
  final ApiService apiService = locator<ApiService>();
  final SharedPreference sharedPreference = locator<SharedPreference>();

  /*shoe items*/
  List<String> shoeVariants = [];

  //color palette adaptive to image
  Future<void> initialize() async {
    shoeVariants.addAll(shoe.images!);
    isLikeClicked(shoe);
    await getPaletteColor();
  }

  Future<void> getPaletteColor() async {
    isBusy = true;
    notifyListeners();
    shoe.paletteColor = await PaletteUtils.getColorFromImage(shoe.images![0]);
    isBusy = false;
    notifyListeners();
  }

  //shoe description expansion
  bool isExpanded = false;

  void onTextState() {
    if (!isExpanded) {
      isExpanded = true;
    } else {
      isExpanded = false;
    }
    notifyListeners();
  }

  bool onState() {
    return isExpanded;
  }

  //shoe variant selection
  int selected = 0;

  void onVariantSelected(int clicked) {
    selected = clicked;
    notifyListeners();
  }

  //shoe size selection
  String? selectedSize;

  List<String> getSelectedSize() {
    if (selectedSize == null) return [];
    return [selectedSize!];
  }

  List<String> getAvailableShoeSizes() {
    // TODO: show.availableSizes <string>[]
    ALL_SHOE_SIZES.clear();
    ALL_SHOE_SIZES.addAll(shoe.sizes!);
    return ALL_SHOE_SIZES;
  }

  void onSizeSelectedCallback(List<String> values) {
    // always 1 or 0 item
    if (values.isNotEmpty) {
      selectedSize = values.first;
      notifyListeners();
    }
  }

  void isLikeClicked(Shoe shoe) {
    if (applicationViewModel.myWishlist[shoe] == true) {
      liked = true;
      notifyListeners();
    } else {
      liked = false;
      notifyListeners();
    }
  }

  Future<void> isLiked(Shoe shoe) async {
    try {
      user = await sharedPreference.getUser();
      if (applicationViewModel.myWishlist[shoe] == false ||
          applicationViewModel.myWishlist[shoe] == null) {
        applicationViewModel.myWishlist[shoe] = true;
        liked = true;
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
        applicationViewModel.myWishlist[shoe] = false;
        liked = false;
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
      applicationViewModel.initializeWishlist();
    } catch (e) {
      rethrow;
    }
    notifyListeners();
  }

  Future<void> addToMyCart(Shoe shoe) async {
    try {
      user = await sharedPreference.getUser();
      if (user != null) {
        await apiService.addToMyCart(CartObject(
            userId: int.parse(user!.id!),
            productId: int.parse(shoe.id.toString())));
            notifyListeners();
        applicationViewModel.addToCart(shoe);
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    }
    await applicationViewModel.getMyCart();
    notifyListeners();
  }
}
