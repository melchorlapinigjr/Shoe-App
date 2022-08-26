import 'package:flutter/material.dart';
import 'package:flutter_shoe_app/app/app.locator.dart';
import 'package:flutter_shoe_app/models/shoe_object.dart';
import 'package:flutter_shoe_app/views/application/application_view_model.dart';
import 'package:flutter_shoe_app/views/check_out_page/checkout_page_view_model.dart';
import 'package:stacked/stacked.dart';

class CheckoutItemView extends ViewModelWidget<CheckoutPageViewModel> {
  CheckoutItemView({Key? key, required this.shoe}) : super(key: key);
  final ApplicationViewModel applicationViewModel =
      locator<ApplicationViewModel>();
  final Shoe shoe;

  @override
  Widget build(BuildContext context, CheckoutPageViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
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
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Number of items: ${viewModel.applicationViewModel.cart[shoe].toString()}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
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
                        viewModel.applicationViewModel.getTotalPrice(shoe),
                        style: TextStyle(
                          color: const Color(0xff1F2732).withOpacity(0.5),
                        ),
                      ),
                    ]),
              ),
            ],
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
