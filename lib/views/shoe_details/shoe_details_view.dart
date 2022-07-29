import 'package:flutter/material.dart';
import 'package:flutter_shoe_app/resources/assets/icons/svg_icons.dart';
import 'package:flutter_shoe_app/views/application/application_view_model.dart';
import 'package:flutter_shoe_app/views/home/shoe_object.dart';
import 'package:flutter_shoe_app/views/shoe_details/shoe_banner_view.dart';
import 'package:flutter_shoe_app/views/shoe_details/shoe_description_view.dart';
import 'package:flutter_shoe_app/views/shoe_details/shoe_details_model.dart';
import 'package:flutter_shoe_app/views/shoe_details/shoe_sizes_view.dart';
import 'package:flutter_shoe_app/views/shoe_details/shoe_variants_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

class ShoeDetailsView extends StatelessWidget {
  const ShoeDetailsView(
    this.shoe, {
    Key? key,
    required this.applicationViewModel,
  }) : super(key: key);
  final ApplicationViewModel applicationViewModel;
  final Shoe shoe;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ShoeDetailsModel>.reactive(
        viewModelBuilder: () => ShoeDetailsModel(shoe),
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
                          onPressed: () {},
                          icon: SvgPicture.asset(SvgIcons.heartIcon))
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
                              itemBuilder: (context, index) =>
                                  ShoeVariantView(viewModel.items[index]),
                              separatorBuilder: (context, _) =>
                                  const SizedBox(width: 8),
                              itemCount: viewModel.items.length),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Padding(
                              padding:
                                  EdgeInsets.only(top: 30, left: 16, bottom: 8),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text('Select Sizes',
                                    style: TextStyle(
                                      color: Color(0xff1F2732),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w900,
                                    )),
                              ),
                            ),
                            Center(
                              child: Wrap(
                                  spacing: 8,
                                  runSpacing: 8,
                                  alignment: WrapAlignment.start,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    for (String item in viewModel.sizes)
                                      ShoeSizesView(item),
                                  ]),
                            ),
                          ],
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
                        onPressed: () {
                          applicationViewModel.addToCart(shoe);
                        },
                        child: const Text('Add to Bag',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                            ),
                            textAlign: TextAlign.center),
                      )),
                );
        });
  }
}
