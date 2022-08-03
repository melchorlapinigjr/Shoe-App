import 'package:flutter/material.dart';
import 'package:flutter_shoe_app/utils/palette_utils.dart';
import 'package:flutter_shoe_app/views/application/application_view_model.dart';
import 'package:flutter_shoe_app/views/home/shoe_object.dart';
import 'package:palette_generator/palette_generator.dart';

class HomeViewModel extends ChangeNotifier {
  List<String> categories = [
    "All",
    "Air Max",
    "Presto",
    "Huarache",
    "Mercurial"
  ];

  //initialize for color storing
  List<PaletteColor> colors = [];

  //values for each shoe card
  List<Shoe> items = ApplicationViewModel.items;

  String selectedCategory = "All";

  void onCategorySelected(String category) {
    selectedCategory = category;
    notifyListeners();
  }

  bool isBusy = false;

  Future<void> initialize() async {
    stackIndex = 0;
    isHomeTrue();
    await getColors();
  }

  Future<void> getColors() async {
    isBusy = true;
    notifyListeners();
    for (Shoe s in items) {
      s.paletteColor = await PaletteUtils.getColorFromImage(s.image);
    }
    isBusy = false;
    notifyListeners();
  }

  //bottom navbar switching
  bool isHome = false;
  bool isWishlist = false;
  bool isCart = false;
  bool isProfile = false;

  void isHomeTrue() {
    isHome = true;
    isWishlist = false;
    isCart = false;
    isProfile = false;
    notifyListeners();
  }

  void isWishlistTrue() {
    isHome = false;
    isWishlist = true;
    isCart = false;
    isProfile = false;
    notifyListeners();
  }

  void isCartTrue() {
    isHome = false;
    isWishlist = false;
    isCart = true;
    isProfile = false;
    notifyListeners();
  }

  void isProfileTrue() {
    isHome = false;
    isWishlist = false;
    isCart = false;
    isProfile = true;
    notifyListeners();
  }

  //IndexedStack
  int stackIndex = 0; //page index

  void changeIndex(int index) {
    stackIndex = index;
    if (stackIndex == 0) {
      isHomeTrue();
    } else if (stackIndex == 1) {
      isCartTrue();
    } else if (stackIndex == 2) {
      isWishlistTrue();
    }
    notifyListeners();
  }
}
