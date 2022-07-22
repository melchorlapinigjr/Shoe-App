import 'package:flutter_shoe_app/views/shoe_details/shoe_details_model.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';

class ShoeSizesView extends ViewModelWidget<ShoeDetailsModel> {
  const ShoeSizesView(this.sizes, {Key? key}) : super(key: key);

  final String sizes;

  @override
  Widget build(BuildContext context, viewModel) {
    bool isSelectedSize = viewModel.selectedSize == viewModel.sizes.indexOf(sizes);
    bool isNotAvailable = sizes == 'UK 11' || sizes == 'UK 13';
    return  InkWell(
      onTap: isNotAvailable? null:(){
        viewModel.onSizeSelected(viewModel.sizes.indexOf(sizes));
      },
      child: Container(
        width: 66,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            width: 2,
            color: isSelectedSize ? const Color(0xff1F2732) : const Color(0xffDEE3EB),
          ),
        ),
        child: Text(sizes,
            textAlign: TextAlign.center,
            style:  TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: isNotAvailable ? const Color(0xff1F2732).withOpacity(0.3) : const Color(0xff1F2732),
            )),
      ),
    );
  }
}
