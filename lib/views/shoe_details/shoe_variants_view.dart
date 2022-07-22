import 'package:flutter/material.dart';
import 'package:flutter_shoe_app/views/home/shoe_object.dart';
import 'package:flutter_shoe_app/views/shoe_details/shoe_details_model.dart';
import 'package:stacked/stacked.dart';

class ShoeVariantView extends ViewModelWidget<ShoeDetailsModel> {
  const ShoeVariantView(this.shoe, {Key? key}) : super(key: key);

  final Shoe shoe;

  @override
  Widget build(BuildContext context, ShoeDetailsModel viewModel) {
    bool isClicked = viewModel.selected == viewModel.items.indexOf(shoe);
    //print(viewModel.items[index]);
    return InkWell(
      onTap: () {
        viewModel.onVariantSelected(viewModel.items.indexOf(shoe));
      },
      child: Container(
        padding: const EdgeInsets.all(4),
        width: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color(0xfff4f4f4),
          border: Border.all(color: isClicked ? const Color(0xff1F2732) : Colors.transparent,
          width: 2,
          ),
        ),
        child: Image(
          image: AssetImage(shoe.image),
            width: 72,
            height: 90,
      ),
      ),
    );
  }
}
