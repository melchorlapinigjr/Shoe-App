import 'package:flutter/material.dart';
import 'package:flutter_shoe_app/views/home/shoe_object.dart';

class SearchPageViewModel extends ChangeNotifier {
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

  //
  List<Shoe> foundShoes = [];

  bool hideResultCount = true;

  bool hasInput = false;

  void initialize() {
    foundShoes = items;
    notifyListeners();
  }

  void onTextChanged(String input) {
    foundShoes = items
        .where((shoe) => shoe.title.toLowerCase().contains(input.toLowerCase()))
        .toList();
    hideResultCount = false;
    hideResultCount = input.isEmpty ? true : false;
    hasInput = input.isEmpty ? false : true;
    notifyListeners();
  }

  final searchField = TextEditingController();
}
