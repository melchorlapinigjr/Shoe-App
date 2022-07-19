import 'package:flutter/material.dart';
import 'package:flutter_shoe_app/model/homepage/homepage_model.dart';
import 'package:flutter_shoe_app/screen/constants.dart';
import 'package:flutter_shoe_app/views/homepage/shoe_header_view.dart';
import 'package:flutter_shoe_app/views/shoe_details/shoe_details_view.dart';
import 'package:palette_generator/palette_generator.dart';
import 'dart:math' as math;

class HomepageView extends StatefulWidget {
  const HomepageView({Key? key}) : super(key: key);

  @override
  State<HomepageView> createState() => _HomepageViewState();
}

class _HomepageViewState extends State<HomepageView> {
  //initialize for color storing
  List<PaletteColor> colors = [];
  List<String> category = [
    "   All   ",
    "   Air Max   ",
    "   Presto   ",
    "   Huarache   ",
    "   Mercurial   "
  ];
  int selectedIndex = 0;

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
      image: 'assets/images/alpha_savage.png',
      title: 'Alpha Savage',
      price: '₹8,895',
      backgroundColor: Colors.red,
      titleColor: Colors.white,
    ),
    const CardItem(
        image: 'assets/images/air_max_97.png',
        title: 'Air Max 97',
        price: '₹11,897',
        backgroundColor: Colors.yellow,
        titleColor: Color(0xff1F2732)),
    const CardItem(
        image: 'assets/images/kd_13_ep.png',
        title: 'KD 13 EP',
        price: '₹12,995',
        backgroundColor: Colors.blue,
        titleColor: Colors.white),
    const CardItem(
        image: 'assets/images/undercover_react_prest0.png',
        title: 'Undercover React Presto',
        price: '₹12,797',
        backgroundColor: Colors.blue,
        titleColor: Colors.white),
    const CardItem(
        image: 'assets/images/toppng.png',
        title: 'Air Zoom Pegasus 37',
        price: '₹9,995',
        backgroundColor: Colors.blue,
        titleColor: Colors.white),
  ];

  //update Palette per image
  Future<PaletteColor> getColorFromImage(String imagePath) async {
    //item.image;
    PaletteGenerator generator = await PaletteGenerator.fromImageProvider(
      AssetImage(imagePath),
      size: const Size(256, 170),
    );

    return generator.darkVibrantColor ?? PaletteColor(Colors.blue, 100);
//       return generator.dominantColor ?? PaletteColor(Colors.blue, 100);
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Flexible(
            child: ListView(
              primary: false,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              children: const <Widget>[
                 Padding(
                   padding: EdgeInsets.fromLTRB(kDefaultPaddin,0,0,0),
                   child: Text(
                    'Shoes',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 26,
                    ),
                ),
                 ),
                ShoeCategory(),
              ],
            ),
          ),
          Flexible(
            child: SizedBox(
              height: 304,
              child: ListView.separated(
                padding: const EdgeInsets.all(16),
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                separatorBuilder: (context, _) => const SizedBox(width: 16),
                itemBuilder: (context, index) => buildCard(
                  item: items[index],
                ),
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '${items.length.toString()} OPTIONS',
                  ),
                ),
              ),
              const Divider(
                color: Colors.grey,
                //height: 20,
                thickness: 1,
                indent: 10,
                endIndent: 10,
              ),
            ],
          ),
          ListView.separated(
            primary: false,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: items.length,
            separatorBuilder: (context, _) => const Divider(
              color: Color(0xffF4F4F4),
              height: 1,
              thickness: 1,
              indent: 10,
              endIndent: 10,
            ),
            itemBuilder: (context, index) => buildShoeList(
              item: items[index],
            ),
          ),
        ]),
      ),
      backgroundColor: Colors.white,
    );
  }

  Widget buildCategory(int index) {
    return Container(
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
                color: selectedIndex == index ? kTextColor : kTextLightColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildShoeList({required CardItem item}) {
    return InkWell(
      onTap: (){
        //print('tapped');
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return const ShoeDetailsView();
        },));
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                item.price,
                style: TextStyle(
                  color: const Color(0xff1F2732).withOpacity(0.5),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
    );
  }

  Widget buildCard({
    required CardItem item,
  }) {
    return FutureBuilder<PaletteColor>(
        future: getColorFromImage(item.image),
        initialData: PaletteColor(Colors.blue, 1),
        builder: (context, snap) {
          return Stack(
            children: [
              Container(
                width: 276,
                decoration: const BoxDecoration(
                    //color: Colors.grey,
                    ),
              ),
              InkWell(
                onTap: (){
                  print('tapped');
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
                            item.title,
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
                            item.price,
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
                  onTap:(){
                    print('tapped');
                  },
                  child: Transform.rotate(
                  angle: math.pi / 180 * (-30),
                  child: Image.asset(
                    item.image,
                    width: 252,
                  ),
                ),
              ),
              ),
            ],
          );
        });
  }
}
