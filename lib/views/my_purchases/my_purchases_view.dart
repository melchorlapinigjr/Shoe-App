// ignore_for_file: dead_code

import 'package:flutter/material.dart';

class MyPurchasesView extends StatelessWidget {
  const MyPurchasesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "My Purchases",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
          ),
          backgroundColor: Colors.white,
          elevation: 1,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text("To Pay",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      )),
                ),
                const SizedBox(
                  height: 4,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: const Color(0xff3700b3).withOpacity(0.1),
                  ),
                  //child: ListView.builder(itemBuilder: itemBuilder),
                ),
              ],
            ),
          ),
        ));
  }
}
