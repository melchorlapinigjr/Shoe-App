import 'package:flutter/material.dart';
import 'package:flutter_shoe_app/utils/palette_utils.dart';
import 'package:flutter_shoe_app/views/widgets/show_sizes_view.dart';
import '../home/shoe_object.dart';

class ShoeDetailsModel extends ChangeNotifier {
  Shoe shoe;

  ShoeDetailsModel(this.shoe, this.liked);

  bool isBusy = false;

  String description =
      'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.';

  /*shoe items*/
  List<String> shoeVariants = [];

  //color palette adaptive to image
  Future<void> initialize() async {
    shoeVariants.addAll(shoe.images!);
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

  //wishlist
bool liked;

  void isLikeClicked(Shoe shoe){
    liked = shoe.isLiked;
    notifyListeners();
  }
}
