import 'package:flutter/material.dart';
import 'package:flutter_shoe_app/app/app.locator.dart';
import 'package:flutter_shoe_app/app/app.router.dart';
import 'package:flutter_shoe_app/core/services/api/api_service.dart';
import 'package:flutter_shoe_app/core/services/shared_preferrence/shared_preference.dart';
import 'package:flutter_shoe_app/models/cart_object.dart';
import 'package:flutter_shoe_app/models/shoe_object.dart';
import 'package:flutter_shoe_app/models/user_object.dart';
import 'package:flutter_shoe_app/views/application/application_view_model.dart';
import 'package:stacked/stacked.dart';

class CartItemView extends StatelessWidget {
  const CartItemView(
      {Key? key,
      required this.shoe,
      required this.quantity,
      required this.cartObject})
      : super(key: key);

  final Shoe shoe;
  final CartObject cartObject;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    final SharedPreference sharedPreference = locator<SharedPreference>();
    final ApiService apiService = locator<ApiService>();
    return ViewModelBuilder<ApplicationViewModel>.reactive(
        disposeViewModel: false,
        viewModelBuilder: () => locator<ApplicationViewModel>(),
        builder: (context, viewModel, child) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: InkWell(
              onTap: () {
                viewModel.navigationService.pushNamed(Routes.ShoeDetails,
                    arguments: ShoeDetailsViewArguments(
                        shoe: shoe,
                        applicationViewModel: locator<ApplicationViewModel>()));
              },
              child: Row(
                children: <Widget>[
                  Column(
                    children: [
                      ClipRect(
                        child: Image.network(
                          shoe.images![0],
                          width: 127.93,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        height: 25,
                        width: 87,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            InkWell(
                              onTap: () async {
                                await apiService.removeFromMyCart(
                                    CartObject(id: cartObject.id));
                                viewModel.removeFromCart(shoe);
                              },
                              child: Container(
                                width: 29,
                                height: 30,
                                color: const Color(0xff1F2732),
                                child: const Center(
                                  child: Text(
                                    '-',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 29,
                              height: 30,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                color: Colors.black,
                              )),
                              child: Center(
                                  child: Text(
                                quantity.toString(),
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                            ),
                            InkWell(
                              onTap: () async {
                                User user = await sharedPreference.getUser();
                                await apiService.addToMyCart(CartObject(
                                    userId: int.parse(user.id!),
                                    productId: int.parse(shoe.id.toString())));
                                viewModel.addToCart(shoe);
                              },
                              child: Container(
                                width: 29,
                                height: 30,
                                color: const Color(0xff1F2732),
                                child: const Center(
                                  child: Text(
                                    '+',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 32,
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          shoe.name ?? "",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            overflow: TextOverflow.clip,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          viewModel.getTotalPrice(shoe),
                          style: TextStyle(
                            color: const Color(0xff1F2732).withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
