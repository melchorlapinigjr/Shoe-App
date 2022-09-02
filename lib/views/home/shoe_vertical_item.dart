import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shoe_app/app/app.locator.dart';
import 'package:flutter_shoe_app/app/app.router.dart';
import 'package:flutter_shoe_app/core/services/navigation/navigation_service.dart';
import 'package:flutter_shoe_app/extensions/double_extension.dart';
import 'package:flutter_shoe_app/models/shoe_object.dart';
import 'package:flutter_shoe_app/resources/assets/icons/svg_icons.dart';
import 'package:flutter_shoe_app/views/application/application_view_model.dart';
import 'package:flutter_svg/svg.dart';

typedef LikePressed = void Function(Shoe shoe);

class ShoeVerticalItem extends StatelessWidget {
  final Shoe item;

  ShoeVerticalItem(
      {super.key,
      required this.item,
      required this.onLikePressed,
      this.liked,
      required this.isWishlistPage,
      required this.applicationViewModel});

  bool? liked;
  bool isWishlistPage;
  final LikePressed onLikePressed;
  final ApplicationViewModel applicationViewModel;
  final NavigationService navigationService = locator<NavigationService>();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigationService.pushNamed(Routes.ShoeDetails,
            arguments: ShoeDetailsViewArguments(
                shoe: item, applicationViewModel: ApplicationViewModel()));
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Row(
          children: <Widget>[
            CachedNetworkImage(
              imageUrl: item.images![0],
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              width: 127.93,
              height: 127.93,
            ),
            const SizedBox(
              width: 32,
            ),
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name ?? "",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'GothamBold',
                      overflow: TextOverflow.clip,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item.price!.toCurrencyFormat(),
                        style: TextStyle(
                          fontFamily: 'Avalon',
                          color: const Color(0xff1F2732).withOpacity(0.5),
                        ),
                      ),
                      Align(
                          alignment: Alignment.centerRight,
                          child: isWishlistPage
                              ? IconButton(
                                  icon: SvgPicture.asset(
                                    applicationViewModel.myWishlist[item]!
                                        ? SvgIcons.heartFilled
                                        : SvgIcons.heartBordered,
                                    width: 19,
                                    height: 17,
                                  ),
                                  onPressed: () {
                                    applicationViewModel.isLiked(item);
                                  },
                                )
                              : Container())
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
