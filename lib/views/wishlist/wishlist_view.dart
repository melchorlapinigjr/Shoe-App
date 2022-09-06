import 'package:flutter/material.dart';
import 'package:flutter_shoe_app/app/app.locator.dart';
import 'package:flutter_shoe_app/views/application/application_view_model.dart';
import 'package:flutter_shoe_app/views/home/shoe_vertical_item.dart';
import 'package:flutter_shoe_app/views/widgets/circular_%20progress.dart';
import 'package:stacked/stacked.dart';

class WishlistView extends StatelessWidget {
  const WishlistView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ApplicationViewModel>.reactive(
        viewModelBuilder: () => locator<ApplicationViewModel>(),
        disposeViewModel: false,
        builder: (context, viewModel, child) {
          if (viewModel.isWishlistInitialized == true) {
            if (viewModel.wishlist.isNotEmpty) {
              return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                      padding: const EdgeInsets.only(right: 8.0, left: 8),
                      child: ListView.builder(
                          primary: false,
                          shrinkWrap: true,
                          itemCount: viewModel.myWishlist.length,
                          itemBuilder: (context, index) {
                            final shoe =
                                viewModel.myWishlist.keys.toList()[index];
                            return ShoeVerticalItem(
                              item: shoe,
                              key: ValueKey(shoe),
                              onLikePressed: viewModel.onShoeLikePressed,
                              isWishlistPage: true,
                              applicationViewModel: viewModel,
                            );
                          })));
            } else {
              return const Center(
                child: Text('You have not added your likes yet'),
              );
            }
          } else {
            return CircularProgress();
          }
        });
  }
}
