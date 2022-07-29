import 'package:flutter/material.dart';
import 'package:flutter_shoe_app/views/application/application_view_model.dart';
import 'package:flutter_shoe_app/views/home/home_view.dart';
import 'package:flutter_shoe_app/views/shop/shop_view.dart';
import 'package:stacked/stacked.dart';

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
      home: MyHomePage(),
      // ViewModelBuilder<ApplicationViewModel>.reactive(
      //   builder: (context, model, child) {
      //     //return const HomepageView();
      //     return const MyHomePage();
      //   },
      //   viewModelBuilder: () => ApplicationViewModel(),
      //   disposeViewModel: false,
      // ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.home),
        title: const Text(
          'Shoes App',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
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
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const ShopView();
                    },
                  ));
                },
                child: const Text('Shop')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      PageRouteBuilder(pageBuilder: (_, __, ___) {
                    return ViewModelBuilder<ApplicationViewModel>.reactive(
                      disposeViewModel: false,
                      builder: (context, model, child) {
                        //return const HomepageView();
                        return const HomepageView();
                      },
                      viewModelBuilder: () => ApplicationViewModel(),
                    );
                  }));
                },
                child: const Text('Shoe Home UI')),
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
