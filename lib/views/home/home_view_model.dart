import 'package:flutter/material.dart';
import 'package:flutter_shoe_app/core/services/api/api_service.dart';
import 'package:flutter_shoe_app/utils/palette_utils.dart';
import 'package:flutter_shoe_app/views/home/shoe_object.dart';
import 'package:palette_generator/palette_generator.dart';

import '../../app/app.locator.dart';

class HomeViewModel extends ChangeNotifier {
  List<String> categories = [
    "All",
  ];

  final ApiService apiService = locator<ApiService>();

  //initialize for color storing
  List<PaletteColor> colors = [];

  //values for each shoe card
  List<Shoe> items = [];

  List<Shoe> itemsByCategory = [];

  String selectedCategory = "All";

  Future<void> getShoes() async {
    if (items != null) {
      items.clear();
      categories.clear();
      categories.add('All');
    }
    isBusy = true;
    notifyListeners();
    final shoes = await apiService.getShoes();
    final shoeCategories = await apiService.getShoesCategory();
    items.addAll(shoes);
    for (var s in shoeCategories) {
      categories.add(s.toString().substring(15, s.toString().length - 1));
    }
    isBusy = false;
    notifyListeners();
  }

  //start shoe horizontal widget//
  bool itemsLoaded = false;

  Future<void> getShoesByCategory(String category) async {
    itemsLoaded = true;
    itemsByCategory.clear();
    notifyListeners();
    final shoes = await apiService.getShoesByCategory(category);
    itemsByCategory.addAll(shoes);
    for (Shoe s in itemsByCategory) {
      s.paletteColor = await PaletteUtils.getColorFromImage(s.images![0]);
    }
    itemsLoaded = false;
    notifyListeners();
  }

  void onCategorySelected(String category) {
    selectedCategory = category;
    notifyListeners();
  }

//end shoe horizontal widget//

  bool isBusy = false;

  Future<void> initialize() async {
    await getShoes();
    getShoesByCategory(selectedCategory);
    stackIndex = 0;
    isHomeTrue();
    await getColors(items);
  }

  Future<void> getColors(List<Shoe> item) async {
    isBusy = true;
    notifyListeners();
    for (Shoe s in item) {
      s.paletteColor = await PaletteUtils.getColorFromImage(s.images![0]);
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
    } else if (stackIndex == 3) {
      isProfileTrue();
    }
    notifyListeners();
  }
}
