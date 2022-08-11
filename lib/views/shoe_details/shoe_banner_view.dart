import 'package:flutter/material.dart';
import 'package:flutter_shoe_app/views/home/shoe_object.dart';

class ShoeBannerView extends StatelessWidget {

  final Shoe shoe;

  const ShoeBannerView(this.shoe, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Stack(children: [
            Positioned(
                top: -294,
                left: -14,
                child: Container(
                  //margin: EdgeInsets.all(100),
                  width: 564,
                  height: 564,
                  decoration: BoxDecoration(
                    color: shoe.paletteColor?.color.withOpacity(0.7),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(1000),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(top:98, bottom: 36),
              child: Stack(children: [
                Align(
                  alignment: Alignment.center,
                  child: Hero(
                    tag: '2',
                    child: Image.network(
                        shoe.images![0],
                        width: 256.21,
                        height: 141.67),
                  ),
                ),
              ]),
            ),
          ]);
  }
}
