import 'package:flutter/material.dart';
import 'package:flutter_shoe_app/utils/palette_utils.dart';
import 'package:flutter_shoe_app/views/home/shoe_object.dart';
import 'package:flutter_shoe_app/views/shoe_details/shoe_details_view.dart';
import 'package:palette_generator/palette_generator.dart';
import 'dart:math' as math;


class ShoeHorizontalItem extends StatelessWidget {
  final Shoe shoe;

  const ShoeHorizontalItem(this.shoe, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PaletteColor>(
        future: PaletteUtils.getColorFromImage(shoe.image),
        initialData: PaletteColor(Colors.blue, 1),
        builder: (context, snap) {
          return Stack(
            children: [
              Container(
                width: 276,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return ShoeDetailsView(shoe);
                  }));
                },
                child: Container(
                  width: 256,
                  padding: const EdgeInsets.fromLTRB(24, 0, 0, 0),
                  decoration: BoxDecoration(
                      color: snap.data?.color.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(16)),
                  child: Stack(children: [
                    Positioned(
                      top: 32,
                      child: Column(
                        children: [
                          Text(
                            shoe.title,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              //color: snap.data?.color,
                              color: snap.data?.titleTextColor.withOpacity(1.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 63,
                      child: Column(
                        children: [
                          Text(
                            shoe.price,
                            style: TextStyle(
                                fontSize: 18,
                                //color: snap.data?.color.withOpacity(0.7)),
                                color:
                                snap.data?.titleTextColor.withOpacity(0.6)),
                          ),
                        ],
                      ),
                    ),
                    VerticalDivider(
                      color: Colors.white.withOpacity(0.3),
                      thickness: 3,
                      indent: 88,
                      endIndent: 48,
                      width: 20,
                    ),
                  ]),
                ),
              ),
              Positioned(
                top: 45,
                left: 7,
                bottom: 9.87,
                child: InkWell(
                  onTap: () {
                   Navigator.push(context, PageRouteBuilder(
                   transitionDuration: const Duration(seconds: 2),
                   pageBuilder: (_, __, ___) => ShoeDetailsView(shoe))
                   );
                  },
                  child: Transform.rotate(
                    angle: math.pi / 180 * (-30),
                    child: Hero(
                      tag: shoe.image,
                      child: Image(
                        image: AssetImage(shoe.image),
                        width: 252,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
