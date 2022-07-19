import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_shoe_app/views/home/card_item_object.dart';
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
  List<CardItem> items = [
    const CardItem(
      image: 'assets/images/alpha_savage.png',
      title: 'Alpha Savage',
      price: '₹8,895',
      backgroundColor: Colors.red,
      titleColor: Colors.white,
    ),
    const CardItem(
        image: 'assets/images/air_max_97.png',
        title: 'Air Max 97',
        price: '₹11,897',
        backgroundColor: Colors.yellow,
        titleColor: Color(0xff1F2732)),
    const CardItem(
        image: 'assets/images/kd_13_ep.png',
        title: 'KD 13 EP',
        price: '₹12,995',
        backgroundColor: Colors.blue,
        titleColor: Colors.white),
    const CardItem(
        image: 'assets/images/undercover_react_prest0.png',
        title: 'Undercover React Presto',
        price: '₹12,797',
        backgroundColor: Colors.blue,
        titleColor: Colors.white),
    const CardItem(
        image: 'assets/images/toppng.png',
        title: 'Air Zoom Pegasus 37',
        price: '₹9,995',
        backgroundColor: Colors.blue,
        titleColor: Colors.white),
  ];

  String selectedCategory = "All";

  //update Palette per image
  Future<PaletteColor> getColorFromImage(String imagePath) async {
    //item.image;
    PaletteGenerator generator = await PaletteGenerator.fromImageProvider(
      AssetImage(imagePath),
      size: const Size(256, 170),
    );

    return generator.darkVibrantColor ?? PaletteColor(Colors.blue, 100);
//       return generator.dominantColor ?? PaletteColor(Colors.blue, 100);
  }

  void onCategorySelected(String category) {
    selectedCategory = category;
    notifyListeners();
  }
}
