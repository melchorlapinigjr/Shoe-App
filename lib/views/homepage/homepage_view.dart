import 'package:flutter/material.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: ListView(
        children: <Widget>[
          const Text(
            '      243 OPTIONS',
          ),
          const Divider(
            color: Colors.grey,
            height: 20,
            thickness: 1,
            indent: 10,
            endIndent: 10,
          ),
          Container(
            margin: const EdgeInsets.all(4.0),
            child: Card(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4.0))),
              child: InkWell(
                onTap: () => ("price: ₹12, 797"),
                child: Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                      child: Image.asset(
                        'assets/Shoe1.png',
                        width: 127.93,
                        height: 127.93,
                      ),
                    ),
                    const SizedBox(width: 32),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Undercover React Presto',
                        ),
                        Text('₹12, 797'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Divider(
            color: Colors.grey,
            height: 20,
            thickness: 1,
            indent: 10,
            endIndent: 10,
          ),
          Container(
            margin: const EdgeInsets.all(4.0),
            child: Card(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4.0))),
              child: InkWell(
                onTap: () => ("price: ₹12, 797"),
                child: Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                      child: Image.asset(
                        'assets/toppng.png',
                        width: 127.93,
                        height: 127.93,
                      ),
                    ),
                    const SizedBox(width: 32),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Air Zoom Pegasus 37',
                          style: TextStyle(fontFamily: 'RobotoMono'),
                        ),
                        Text('₹9, 995'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Divider(
            color: Colors.grey,
            height: 20,
            thickness: 1,
            indent: 10,
            endIndent: 10,
          ),
          Container(
            margin: const EdgeInsets.all(4.0),
            child: Card(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4.0))),
              child: InkWell(
                onTap: () => ("price: ₹12, 797"),
                child: Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                      child: Image.asset(
                        'assets/Yellow Shoe.png',
                        width: 127.93,
                        height: 127.93,
                      ),
                    ),
                    const SizedBox(width: 32),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Air Max 97',
                          style: TextStyle(fontFamily: 'RobotoMono'),
                        ),
                        Text('₹11, 897'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Divider(
            color: Colors.grey,
            height: 20,
            thickness: 1,
            indent: 10,
            endIndent: 10,
          ),
          Container(
            margin: const EdgeInsets.all(4.0),
            child: Card(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4.0))),
              child: InkWell(
                onTap: () => ("price: ₹12, 797"),
                child: Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                      child: Image.asset(
                        'assets/Blue Shoe.png',
                        width: 127.93,
                        height: 127.93,
                      ),
                    ),
                    const SizedBox(width: 32),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('KD13 EP'),
                        Text('₹12, 995'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Divider(
            color: Colors.grey,
            height: 20,
            thickness: 1,
            indent: 10,
            endIndent: 10,
          ),
          Container(
            margin: const EdgeInsets.all(4.0),
            child: Card(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4.0))),
              child: InkWell(
                onTap: () => ("price: ₹12, 797"),
                child: Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                      child: Image.asset(
                        'assets/Red Shoe.png',
                        width: 127.93,
                        height: 127.93,
                      ),
                    ),
                    const SizedBox(width: 32),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Alpha Savage'),
                        Text('₹8, 895'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Divider(
            color: Colors.grey,
            height: 20,
            thickness: 1,
            indent: 10,
            endIndent: 10,
          ),
          Container(
            margin: const EdgeInsets.all(4.0),
            child: Card(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4.0))),
              child: InkWell(
                onTap: () => ("price: ₹12, 797"),
                child: Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                      child: Image.asset(
                        'assets/Green 1.png',
                        width: 127.93,
                        height: 127.93,
                      ),
                    ),
                    const SizedBox(width: 32),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Air Presto by You'),
                        Text('₹10, 895'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
