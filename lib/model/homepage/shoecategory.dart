import 'package:flutter/material.dart';

import '../../screen/constants.dart';

class ShoeCategory extends StatefulWidget {
  const ShoeCategory({Key? key}) : super(key: key);

  @override
  State<ShoeCategory> createState() => _ShoeCategoryState();
}

class _ShoeCategoryState extends State<ShoeCategory> {
  List<String> category = [
    "   All   ",
    "   Air Max   ",
    "   Presto   ",
    "   Huarache   ",
    "   Mercurial   "
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: SizedBox(
        height: 25,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: category.length,
          itemBuilder: (context, index) => buildCategory(index),
        ),
      ),
    );
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      child: InkWell(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
          child: Container(
            decoration: BoxDecoration(
                color: selectedIndex == index ? Colors.black : Colors.black12,
                border: Border.all(color: Colors.black26),
                borderRadius: const BorderRadius.all(Radius.circular(18))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    category[index],
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontSize: 16,
                      color:
                          selectedIndex == index ? kTextColor : kTextLightColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
