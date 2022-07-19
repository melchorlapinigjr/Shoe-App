import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShoeDetailsView extends StatefulWidget {
  const ShoeDetailsView({Key? key}) : super(key: key);

  @override
  State<ShoeDetailsView> createState() => _ShoeDetailsViewState();
}

class _ShoeDetailsViewState extends State<ShoeDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shoe Details'),
        elevation: 0,
        //backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: InkWell(
              onTap: () {},
              child: SvgPicture.asset(
                'assets/images/heart.svg',
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.fromLTRB(24, 0, 24, 40),
              height: 48,
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xff1F2732))
                    ),
                onPressed: () {},
                child: const Text('Add to Cart', textAlign: TextAlign.center),
              ),
            ),
          )
        ],
      ),
    );
  }
}
