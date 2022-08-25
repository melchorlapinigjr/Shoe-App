import 'package:flutter/material.dart';
import 'package:flutter_shoe_app/app/app.locator.dart';
import 'package:flutter_shoe_app/core/services/api/api_service.dart';
import 'package:flutter_shoe_app/core/services/shared_preferrence/shared_preference.dart';
import 'package:flutter_shoe_app/models/cart_object.dart';
import 'package:flutter_shoe_app/models/shoe_object.dart';
import 'package:flutter_shoe_app/models/user_object.dart';
import 'package:flutter_shoe_app/views/application/application_view_model.dart';
import 'package:get/get.dart';

class CheckOutItemViewModel extends ChangeNotifier {
  Shoe shoe;

  CheckOutItemViewModel(this.shoe);

  User? user;

  final ApiService apiService = locator<ApiService>();
  final SharedPreference sharedPreference = locator<SharedPreference>();
  final ApplicationViewModel applicationViewModel =
      locator<ApplicationViewModel>();

  Future<void> checkOutItem(Shoe shoe) async {
    try {
      user = await sharedPreference.getUser();
      if (user != null) {
        await apiService.checkOut(CartObject(
            userId: int.parse(user!.id!),
            productId: int.parse(shoe.id.toString()),
            quantity: applicationViewModel.cart[shoe]));
      }
      ScaffoldMessenger.of(Get.context!).showSnackBar(
          const SnackBar(content: Text('Payment done successfully!')));
    } catch (e) {
      rethrow;
    }
  }
}
