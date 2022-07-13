import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'dart:math' as math;

class CardView extends StatefulWidget {
  const CardView({Key? key}) : super(key: key);

  @override
  State<CardView> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  //initialize for color storing
  List<PaletteColor> colors = [];

  @override
  void initState() {
    super.initState();
    //colors = [];
    //_currentIndex =0;
    //_updatePalettes();
  }

  //values for each shoe card
  List<CardItem> items = [
    const CardItem(
      image: 'assets/images/red_shoe.png',
      title: 'Alpha Savage',
      price: '₹8,895',
      backgroundColor: Colors.red,
      titleColor: Colors.white,
    ),
    const CardItem(
        image: 'assets/images/yellow_shoe.png',
        title: 'Alpha Savage',
        price: '₹8,895',
        backgroundColor: Colors.yellow,
        titleColor: Color(0xff1F2732)),
    const CardItem(
        image: 'assets/images/blue_shoe.png',
        title: 'Alpha Savage',
        price: '₹8,895',
        backgroundColor: Colors.blue,
        titleColor: Colors.white),
  ];

  //update Palette per image
  Future<PaletteColor> getColorFromImage(String imagePath) async {
    //item.image;
    PaletteGenerator generator = await PaletteGenerator.fromImageProvider(
      AssetImage(imagePath),
      size: const Size(200, 100),
    );

    return generator.lightVibrantColor ?? PaletteColor(Colors.blue, 100);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shoe Cards'),
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
            onPressed: () {},
          )
        ],
        backgroundColor: Colors.white,
      ),
      body: Container(
        height: 304,
        child: ListView.separated(
          padding: const EdgeInsets.all(16),
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          separatorBuilder: (context, _) => const SizedBox(width: 16),
          itemBuilder: (context, index) => buildCard(
            item: items[index],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  Widget buildCard({
    required CardItem item,
  }) {
    return FutureBuilder<PaletteColor>(
        future: getColorFromImage(item.image),
        initialData: PaletteColor(Colors.white, 1),
        builder: (context, snap) {
          return Stack(
            children: [
              Container(
                width: 276,
                decoration: const BoxDecoration(
                    //color: Colors.grey,
                    ),
              ),
              Container(
                width: 256,
                padding: const EdgeInsets.fromLTRB(24, 0, 0, 0),
                decoration: BoxDecoration(
                    color: snap.data?.color.withOpacity(0.50),
                    borderRadius: BorderRadius.circular(16)),
                child: Stack(children: [
                  Positioned(
                    top: 32,
                    child: Column(
                      children: [
                        Text(
                          item.title,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            //color: snap.data?.color,
                            color: item.titleColor,
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
                          item.price,
                          style: TextStyle(
                              fontSize: 18,
                              //color: snap.data?.color.withOpacity(0.7)),
                              color: item.titleColor.withOpacity(0.7)),
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
              Positioned(
                top: 45,
                left: 7,
                bottom: 9.87,
                child: Transform.rotate(
                  angle: math.pi / 180 * (-30),
                  child: Image.asset(
                    item.image,
                    width: 252,
                  ),
                ),
              ),
            ],
          );
        });
  }
}

//model class for per card values
class CardItem {
  final String image;
  final String title;
  final String price;
  final Color backgroundColor;
  final Color titleColor;

  const CardItem({
    required this.image,
    required this.title,
    required this.price,
    required this.backgroundColor,
    required this.titleColor,
  });
}
