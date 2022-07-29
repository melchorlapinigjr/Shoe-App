import 'package:flutter/material.dart';
import 'package:flutter_shoe_app/views/application/application_view_model.dart';
import 'package:flutter_shoe_app/views/cart/cart_page_view.dart';
import 'package:flutter_shoe_app/views/home/home_view_model.dart';
import 'package:flutter_shoe_app/views/home/home_view_widget.dart';
import 'package:flutter_shoe_app/views/search_page/search_page_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_shoe_app/resources/assets/icons/svg_icons.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class HomepageView extends StatelessWidget {
  const HomepageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(),
        onModelReady: (model) => model.initialize(),
        builder: (context, viewModel, child) {
          return viewModel.isBusy
              ? const Scaffold(
                  backgroundColor: Colors.white,
                  body: Center(
                      child: CircularProgressIndicator(
                    color: Color(0xff1F2732),
                  )),
                )
              : Scaffold(
                  appBar: AppBar(
                    automaticallyImplyLeading: false,
                    title: const Text('Shoe Cards'),
                    elevation: 0,
                    actions: <Widget>[
                      IconButton(
                        icon: const Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const SearchPageView()));
                        },
                      )
                    ],
                    backgroundColor: Colors.white,
                  ),
                  body: IndexedStack(
                    index: viewModel.stackIndex,
                    children: const [
                      HomeViewWidget(),
                      CartPageView(),
                    ],
                  ),
                  backgroundColor: Colors.white,
                  bottomNavigationBar: Container(
                    height: 92,
                    color: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: viewModel.isHome
                                    ? const Color(0xff1F2732)
                                    : Colors.white,
                                border: Border.all(
                                  color: Colors.black.withOpacity(0.3),
                                ),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  viewModel.isHomeTrue();
                                  viewModel.changeIndex(0);
                                },
                                icon: SvgPicture.asset(
                                  SvgIcons.homeIcon,
                                  color: viewModel.isHome
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                            Text(
                              'Home',
                              style: TextStyle(
                                fontWeight: viewModel.isHome
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: viewModel.isWishlist
                                    ? const Color(0xff1F2732)
                                    : Colors.white,
                                border: Border.all(
                                    color: Colors.black.withOpacity(0.3)),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  viewModel.isWishlistTrue();
                                },
                                icon: SvgPicture.asset(SvgIcons.heartIcon,
                                    color: viewModel.isWishlist
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                            Text(
                              'Wishlist',
                              style: TextStyle(
                                fontWeight: viewModel.isWishlist
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: viewModel.isCart
                                    ? Colors.black
                                    : Colors.white,
                                border: Border.all(
                                    color: Colors.black.withOpacity(0.3)),
                              ),
                              child: Stack(children: [
                                IconButton(
                                  onPressed: () {
                                    viewModel.isCartTrue();
                                    viewModel.changeIndex(1);
                                  },
                                  icon: SvgPicture.asset(SvgIcons.cartIcon,
                                      color: viewModel.isCart
                                          ? Colors.white
                                          : Colors.black),
                                ),
                                Positioned(
                                    right: 0,
                                    child: Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: const Color(0xffE24C4D),
                                          border: Border.all(
                                            width: 2,
                                            color: Colors.white,
                                          ),
                                        ),
                                        child: Center(
                                          child: ViewModelBuilder<
                                                  ApplicationViewModel>.reactive(
                                              viewModelBuilder: () => Provider
                                                  .of<ApplicationViewModel>(
                                                      context),
                                              builder: (context, model, child) {
                                                return Text(
                                                  '${model.cart.length}',
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white,
                                                  ),
                                                );
                                              }),
                                        ))),
                              ]),
                            ),
                            Text(
                              'Cart',
                              style: TextStyle(
                                fontWeight: viewModel.isCart
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: viewModel.isProfile
                                    ? Colors.black
                                    : Colors.white,
                                border: Border.all(
                                    color: Colors.black.withOpacity(0.3)),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  viewModel.isProfileTrue();
                                },
                                icon: SvgPicture.asset(SvgIcons.profileIcon,
                                    color: viewModel.isProfile
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                            Text(
                              'Profile',
                              style: TextStyle(
                                fontWeight: viewModel.isProfile
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
        });
  }
}
