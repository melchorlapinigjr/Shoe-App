import 'package:flutter/material.dart';
import 'package:flutter_shoe_app/models/shoe_object.dart';
import 'package:flutter_shoe_app/views/my_purchases/my_purchases_view_model.dart';
import 'package:stacked/stacked.dart';

class MyPurchasesItems extends ViewModelWidget<MyPurchasesViewModel> {
  const MyPurchasesItems(this.shoe, this.quantity, {super.key});

  final Shoe shoe;
  final int quantity;

  @override
  Widget build(BuildContext context, MyPurchasesViewModel viewModel) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      child: Row(
        textBaseline: TextBaseline.alphabetic,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ClipRect(
            child: Image.network(
              shoe.images![0],
              width: 127.93,
              fit: BoxFit.fitWidth,
            ),
          ),
          const SizedBox(
            width: 16.0,
          ),
          Flexible(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Text(
                shoe.name ?? "",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  overflow: TextOverflow.clip,
                ),
              ),
              const SizedBox(height: 8),
              // Align(
              //   alignment: Alignment.centerRight,
              //   child: Text(
              //     shoe.price!.toCurrencyFormat(),
              //     style: TextStyle(
              //       color: const Color(0xff1F2732).withOpacity(0.5),
              //     ),
              //   ),
              // ),
              // const SizedBox(height: 4),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  'x$quantity',
                  style: TextStyle(
                    color: const Color(0xff1F2732).withOpacity(0.3),
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  viewModel.applicationViewModel.getTotalPrice(shoe),
                  style: TextStyle(
                    color: const Color(0xff1F2732).withOpacity(0.5),
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
