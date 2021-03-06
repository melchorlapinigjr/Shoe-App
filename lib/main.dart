import 'package:flutter/material.dart';
import 'package:flutter_shoe_app/views/cart/cart_view.dart';
import 'package:flutter_shoe_app/views/home/home_view.dart';
import 'package:flutter_shoe_app/views/home/shoe_category_view.dart';
import 'package:flutter_shoe_app/views/shop/shop_view.dart';

import 'views/home/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Shoe App',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: MyHomePage(title: 'Shoe App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.home),
        title: Text(
          widget.title,
          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
        ),
        backgroundColor: Colors.black,
        shadowColor: Colors.blue,
      ),

      body: Align(
        alignment: AlignmentDirectional.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ShoeCategoryView();
                  }));
                },
                child: const Text('Shoe Header')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const HomepageView();
                  }));
                },
                child: const Text('Homepage')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const ShopView();
                    },
                  ));
                },
                child: const Text('Shop')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const HomepageView();
                    },
                  ));
                },
                child: const Text('Shoe Home UI')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const CartView();
                    },
                  ));
                },
                child: const Text('Cart')),
            Container(
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.pink, borderRadius: BorderRadius.circular(32)),
              width: MediaQuery.of(context).size.width,
              child: const Center(child: Text('Cart')),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
