import 'package:flutter/material.dart';
import 'package:flutter_shoe_app/extensions/double_extension.dart';
import 'package:flutter_shoe_app/views/home/shoe_object.dart';
import 'package:flutter_shoe_app/views/shoe_details/shoe_details_model.dart';
import 'package:stacked/stacked.dart';

class ShoeDescriptionView extends ViewModelWidget<ShoeDetailsModel> {
  final Shoe shoe;

  const ShoeDescriptionView(this.shoe, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ShoeDetailsModel viewModel) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    shoe.name?? "",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: 'Avenir',
                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                      letterSpacing: -1,
                      color: shoe.paletteColor?.color,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    shoe.price!.toCurrencyFormat(),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: 'Avalon',
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1,
                      color: shoe.paletteColor?.color,
                    ),
                  ),
                ),
              ],
            )),
        Flexible(
          child: Container(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: ShoeDescriptionWidget(viewModel.description),
          ),
        ),
      ],
    );
  }
}

class ShoeDescriptionWidget extends ViewModelWidget<ShoeDetailsModel> {
  const ShoeDescriptionWidget(this.description, {Key? key}) : super(key: key);

  final String description;

  @override
  Widget build(BuildContext context, ShoeDetailsModel viewModel) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      AnimatedSize(
          duration: const Duration(milliseconds: 250),
          child: ConstrainedBox(
              constraints: const BoxConstraints(),
              child: Text(
                description,
                style: const TextStyle(
                    fontFamily: 'Avenir',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff7B8A9E),
                    height: 1.22),
                textAlign: TextAlign.justify,
                overflow: TextOverflow.clip,
                maxLines: viewModel.onState() ? null : 3,
              ))),
      InkWell(
        onTap: () => viewModel.onTextState(),
        child: Text(
          viewModel.onState() ? 'Read Less' : 'Read More',
          style: const TextStyle(
            fontFamily: 'Avenir',
              color: Color(0xFF1F2732), height: 2, fontWeight: FontWeight.bold),
        ),
      ),
    ]);
  }
}

// OutlinedButton.icon(
// icon: const Icon(Icons.arrow_downward, color: Color(0xFFD50000)),
// label: const Text('Read More',
// style: TextStyle(color: Color(0xFF2E7D32))),
// onPressed: () => viewModel.onTextState())
