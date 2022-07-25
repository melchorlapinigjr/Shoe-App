import 'package:flutter/material.dart';
import 'package:flutter_shoe_app/utils/palette_utils.dart';

import '../home/shoe_object.dart';

class ShoeDetailsModel extends ChangeNotifier{
   Shoe shoe;

   ShoeDetailsModel(this.shoe);
   bool isBusy = false;

  String description ='Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.';

  /*shoe items*/
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
        titleColor: const Color(0xff1F2732)),
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

  //shoe sizes
  List<String> sizes = [
    'UK 6',
    'UK 7',
    'UK 8',
    'UK 9',
    'UK 10',
    'UK 11',
    'UK 12',
    'UK 13',
   ];

  //color palette adaptive to image
  Future<void> initialize() async{
    await getPaletteColor();
  }

  Future<void> getPaletteColor() async {
    isBusy = true;
    notifyListeners();
    shoe.paletteColor = await PaletteUtils.getColorFromImage(shoe.image);
    isBusy = false;
    notifyListeners();
  }

  //shoe description expansion
  bool isExpanded = false;

    void onTextState(){
     if(!isExpanded){ isExpanded = true; } else {isExpanded = false;}
     notifyListeners();
   }

  bool onState(){
    return isExpanded;
  }

  //shoe variant selection
  int selected = 0;

  void onVariantSelected(int clicked){
      selected = clicked;
      notifyListeners();
  }

  //shoe size selection
  int selectedSize =0;

  void onSizeSelected(int sizeSelected){
    selectedSize = sizeSelected;
    notifyListeners();
  }
}