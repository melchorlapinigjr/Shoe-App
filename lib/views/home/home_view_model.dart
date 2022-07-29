import 'package:flutter/material.dart';
import 'package:flutter_shoe_app/utils/palette_utils.dart';
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
  List<Shoe> items = [
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
        titleColor: const Color(0xff1F2732)),
    Shoe(
        image: 'lib/resources/assets/images/kd_13_ep.png',
        title: 'KD 13 EP',
        price: 12995,
        backgroundColor: Colors.blue,
        titleColor: Colors.white),
    Shoe(
        image: 'lib/resources/assets/images/undercover_react_presto.png',
        title: 'Undercover React Presto',
        price: 12797,
        backgroundColor: Colors.blue,
        titleColor: Colors.white),
    Shoe(
        image: 'lib/resources/assets/images/air_zoom_pegasus_37.png',
        title: 'Air Zoom Pegasus 37',
        price: 9995,
        backgroundColor: Colors.blue,
        titleColor: Colors.white),
  ];

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
  int stackIndex= 0;

  void changeIndex(int index){
    stackIndex = index;
    notifyListeners();
  }
}
