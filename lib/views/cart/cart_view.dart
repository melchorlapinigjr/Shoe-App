import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Icon(
              Icons.shopping_cart,
              size: 48,
              color: Colors.blue,
            ),
            Text(
              '5',
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
