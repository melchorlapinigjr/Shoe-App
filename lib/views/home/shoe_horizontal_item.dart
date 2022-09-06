import 'dart:math' as math;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shoe_app/app/app.locator.dart';
import 'package:flutter_shoe_app/app/app.router.dart';
import 'package:flutter_shoe_app/core/services/navigation/navigation_service.dart';
import 'package:flutter_shoe_app/extensions/double_extension.dart';
import 'package:flutter_shoe_app/models/shoe_object.dart';
import 'package:flutter_shoe_app/views/application/application_view_model.dart';

class ShoeHorizontalItem extends StatelessWidget {
  final Shoe shoe;
  ShoeHorizontalItem(this.shoe, {Key? key}) : super(key: key);

  final NavigationService navigationService = locator<NavigationService>();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 276,
        ),
        InkWell(
          onTap: () {
            navigationService.pushNamed(Routes.ShoeDetails,
                arguments: ShoeDetailsViewArguments(
                    shoe: shoe, applicationViewModel: ApplicationViewModel()));
          },
          child: Container(
            width: 256,
            height: 304,
            padding: const EdgeInsets.fromLTRB(24, 0, 0, 0),
            decoration: BoxDecoration(
                color: shoe.paletteColor?.color.withOpacity(0.7),
                borderRadius: BorderRadius.circular(16)),
            child: Stack(children: [
              Positioned(
                top: 32,
                child: Column(
                  children: [
                    Text(
                      shoe.name ?? "",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'GothamBold',
                        color:
                            shoe.paletteColor?.titleTextColor.withOpacity(1.0),
                        overflow: TextOverflow.clip,
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
                      shoe.price!.toCurrencyFormat(),
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Avalon',
                          //color: snap.data?.color.withOpacity(0.7)),
                          color: shoe.paletteColor?.titleTextColor
                              .withOpacity(0.6)),
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
              navigationService.pushNamed(Routes.ShoeDetails,
                  arguments: ShoeDetailsViewArguments(
                      shoe: shoe,
                      applicationViewModel: ApplicationViewModel()));
            },
            child: Transform.rotate(
              angle: math.pi / 180 * (-30),
              child: CachedNetworkImage(
                imageUrl: shoe.images![0],
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                width: 252,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
