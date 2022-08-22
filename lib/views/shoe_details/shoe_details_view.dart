import 'package:flutter/material.dart';
import 'package:flutter_shoe_app/models/cart_object.dart';
import 'package:flutter_shoe_app/models/shoe_object.dart';
import 'package:flutter_shoe_app/resources/assets/icons/svg_icons.dart';
import 'package:flutter_shoe_app/views/application/application_view_model.dart';
import 'package:flutter_shoe_app/views/shoe_details/shoe_banner_view.dart';
import 'package:flutter_shoe_app/views/shoe_details/shoe_description_view.dart';
import 'package:flutter_shoe_app/views/shoe_details/shoe_details_model.dart';
import 'package:flutter_shoe_app/views/shoe_details/shoe_variants_view.dart';
import 'package:flutter_shoe_app/views/widgets/show_sizes_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

class ShoeDetailsView extends StatelessWidget {
  ShoeDetailsView(this.shoe,
      {Key? key, required this.applicationViewModel, this.cartObject})
      : super(key: key);

  final Shoe shoe;
  CartObject? cartObject;
  final ApplicationViewModel applicationViewModel;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ShoeDetailsModel>.reactive(
        viewModelBuilder: () => ShoeDetailsModel(shoe, shoe.isLiked),
        onModelReady: (model) => model.initialize(),
        builder: (context, viewModel, child) {
          return viewModel.isBusy
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Color(0xff1F2732),
                  ),
                )
              : Scaffold(
                  extendBodyBehindAppBar: true,
                  //extendBody: true,
                  appBar: AppBar(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    actions: [
                      IconButton(
                        icon: SvgPicture.asset(
                          viewModel.liked
                              ? SvgIcons.heartFilled
                              : SvgIcons.heartBordered,
                          width: 19,
                          height: 17,
                        ),
                        onPressed: () {
                          viewModel.isLikeClicked(shoe);
                          viewModel.isLiked(shoe);
                        },
                      )
                    ],
                  ),
                  body: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(child: ShoeBannerView(shoe)),
                        Flexible(child: ShoeDescriptionView(shoe)),
                        SizedBox(
                          height: 72,
                          child: ListView.separated(
                              padding: const EdgeInsets.only(top: 16, left: 16),
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => ShoeVariantView(
                                  viewModel.shoeVariants[index]),
                              separatorBuilder: (context, _) =>
                                  const SizedBox(width: 8),
                              itemCount: viewModel.shoeVariants.length),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
                          child: ShowSizesView(
                            selectedSizes: viewModel.getSelectedSize(),
                            isMultiSelectMode: false,
                            onSizeSelectedCallback:
                                viewModel.onSizeSelectedCallback,
                            availableSizes: viewModel.getAvailableShoeSizes(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  bottomNavigationBar: Container(
                      margin: const EdgeInsets.fromLTRB(24, 16, 24, 6),
                      height: 48,
                      width: double.infinity,
                      color: Colors.white.withOpacity(0.9),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                shoe.paletteColor?.color),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ))),
                        onPressed: () async {
                          await viewModel.addToMyCart(shoe);
                          applicationViewModel.addToCart(shoe);
                        },
                        child: const Text('Add to Bag',
                            style: TextStyle(
                              fontFamily: 'Avenir',
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                            ),
                            textAlign: TextAlign.center),
                      )),
                );
        });
  }
}
