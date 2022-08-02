import 'package:flutter/material.dart';
import 'package:flutter_shoe_app/extensions/double_extension.dart';
import 'package:flutter_shoe_app/views/application/application_view_model.dart';
import 'package:flutter_shoe_app/views/home/shoe_object.dart';
import 'package:flutter_shoe_app/views/shoe_details/shoe_details_view.dart';
import 'package:provider/provider.dart';

class ShoeVerticalItem extends StatelessWidget {
  final Shoe item;

  const ShoeVerticalItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()  {
        Navigator.push(
            context,
            PageRouteBuilder(
                transitionDuration: const Duration(seconds: 2),
                pageBuilder: (_, __, ___) => ShoeDetailsView(
                  item,
                  applicationViewModel:
                  Provider.of<ApplicationViewModel>(context),
                )));
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Row(
          children: <Widget>[
            Image.asset(
              item.image,
              width: 127.93,
              height: 127.93,
            ),
            const SizedBox(
              width: 32,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'GothamBold',
                      overflow: TextOverflow.clip,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                   item.price.toCurrencyFormat(),
                    style: TextStyle(
                      fontFamily: 'Avalon',
                      color: const Color(0xff1F2732).withOpacity(0.5),
                    ),
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
