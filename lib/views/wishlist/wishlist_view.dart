import 'package:flutter/material.dart';
import 'package:flutter_shoe_app/views/application/application_view_model.dart';
import 'package:flutter_shoe_app/views/home/shoe_vertical_item.dart';
import 'package:stacked/stacked.dart';

class WishlistView extends ViewModelWidget<ApplicationViewModel> {
  const WishlistView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ApplicationViewModel viewModel) {
    return viewModel.myLikes.isNotEmpty
        ? SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
                padding: const EdgeInsets.only(right: 8.0, left: 8),
                child: ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: viewModel.myLikes.length,
                    itemBuilder: (context, index) {
                      final shoe = viewModel.myLikes[index];
                      return ShoeVerticalItem(
                        item: shoe,
                        key: ValueKey(shoe),
                        onLikePressed: viewModel.onShoeLikePressed,
                      );
                    })))
        : const Center(
            child: Text('You have not added your likes yet'),
          );
  }
}
