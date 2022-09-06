import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shoe_app/views/shoe_details/shoe_details_model.dart';
import 'package:stacked/stacked.dart';

class ShoeVariantView extends ViewModelWidget<ShoeDetailsModel> {
  const ShoeVariantView(this.variant, {Key? key}) : super(key: key);

  final String variant;

  @override
  Widget build(BuildContext context, ShoeDetailsModel viewModel) {
    bool isClicked =
        viewModel.selected == viewModel.shoeVariants.indexOf(variant);
    return InkWell(
      onTap: () {
        viewModel.onVariantSelected(viewModel.shoeVariants.indexOf(variant));
      },
      child: Container(
        padding: const EdgeInsets.all(4),
        width: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color(0xfff4f4f4),
          border: Border.all(
            color: isClicked ? const Color(0xff1F2732) : Colors.transparent,
            width: 2,
          ),
        ),
        child: CachedNetworkImage(
          imageUrl: variant,
          progressIndicatorBuilder: (context, url, downloadProgress) => Center(
              child:
                  Center(child: CircularProgressIndicator(value: downloadProgress.progress))),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          width: 72,
          height: 90,
        ),
      ),
    );
  }
}
