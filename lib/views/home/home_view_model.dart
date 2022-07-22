import 'package:flutter/material.dart';
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
  int selectedIndex = 0;

  //initialize for color storing
  List<PaletteColor> colors = [];

  //values for each shoe card
  List<Shoe> items = [
    Shoe(
      image: 'lib/resources/assets/images/alpha_savage.png',
      title: 'Alpha Savage',
      price: '₹8,895',
      backgroundColor: Colors.red,
      titleColor: Colors.white,
    ),
     Shoe(
        image: 'lib/resources/assets/images/air_max_97.png',
        title: 'Air Max 97',
        price: '₹11,897',
        backgroundColor: Colors.yellow,
        titleColor: Color(0xff1F2732)),
     Shoe(
        image: 'lib/resources/assets/images/kd_13_ep.png',
        title: 'KD 13 EP',
        price: '₹12,995',
        backgroundColor: Colors.blue,
        titleColor: Colors.white),
     Shoe(
        image: 'lib/resources/assets/images/undercover_react_presto.png',
        title: 'Undercover React Presto',
        price: '₹12,797',
        backgroundColor: Colors.blue,
        titleColor: Colors.white),
     Shoe(
        image: 'lib/resources/assets/images/air_zoom_pegasus_37.png',
        title: 'Air Zoom Pegasus 37',
        price: '₹9,995',
        backgroundColor: Colors.blue,
        titleColor: Colors.white),
  ];

  String selectedCategory = "All";

  void onCategorySelected(String category) {
    selectedCategory = category;
    notifyListeners();
  }
}
