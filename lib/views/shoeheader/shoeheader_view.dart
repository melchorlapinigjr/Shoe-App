import 'package:flutter/material.dart';
import 'package:flutter_shoe_app/model/homepage/shoecategory.dart';

class ShoeHeaderView extends StatelessWidget {
  const ShoeHeaderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: 30,
            ),
          ),
        ],
      ),
      body: ListView(
        children: const <Widget>[
          Text(
            'Shoes',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 26,
            ),
          ),
          ShoeCategory(),
        ],
      ),
    );
  }
}
