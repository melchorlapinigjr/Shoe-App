import 'package:flutter/material.dart';
import 'package:flutter_shoe_app/utils/palette_utils.dart';
import 'package:flutter_shoe_app/views/widgets/show_sizes_view.dart';

import '../home/shoe_object.dart';

class ShoeDetailsModel extends ChangeNotifier {
  Shoe shoe;

  ShoeDetailsModel(this.shoe);

  bool isBusy = false;

  String description =
      'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.';

  /*shoe items*/
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

  //color palette adaptive to image
  Future<void> initialize() async {
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
    return [
      ALL_SHOE_SIZES[0],
      ALL_SHOE_SIZES[3],
      ALL_SHOE_SIZES[4],
      ALL_SHOE_SIZES[6]
    ];
  }

  void onSizeSelectedCallback(List<String> values) {
    // always 1 or 0 item
    if (values.isNotEmpty) {
      selectedSize = values.first;
      notifyListeners();
    }
  }
}
