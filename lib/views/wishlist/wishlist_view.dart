import 'package:flutter/material.dart';
import 'package:flutter_shoe_app/views/home/home_view_model.dart';
import 'package:flutter_shoe_app/views/home/shoe_vertical_item.dart';


class WishlistView extends StatelessWidget {
  const WishlistView({Key? key, required this.homeViewModel}) : super(key: key);

  final HomeViewModel homeViewModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0, left: 8),
        child: ListView.builder(
        primary: false,
        shrinkWrap: true,
        itemCount: homeViewModel.items.length,
        itemBuilder: (context, index){
          return ShoeVerticalItem(item: homeViewModel.items[index]);
    }),
    ));
  }
}

class WishlistItems extends StatelessWidget {
  const WishlistItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
