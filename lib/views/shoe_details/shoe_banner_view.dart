import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shoe_app/models/shoe_object.dart';

class ShoeBannerView extends StatelessWidget {
  final Shoe shoe;

  const ShoeBannerView(this.shoe, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
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
        padding: const EdgeInsets.only(top: 98, bottom: 36),
        child: Stack(children: [
          Align(
            alignment: Alignment.center,
            child: CachedNetworkImage(
                imageUrl: shoe.images![0],
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                width: 256.21,
                height: 141.67),
          ),
        ]),
      ),
    ]);
  }
}
