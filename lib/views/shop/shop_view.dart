import 'package:flutter/material.dart';

class ShopView extends StatelessWidget {
  const ShopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Shop Page'),
        ),
        body: Column(
          children: [
            Image.network(
              'https://marvel-b1-cdn.bc0a.com/f00000000114841/www.florsheim.com/shop/resources/images/index/SS22-FL-Refresh2-MainStudio-Desktop.jpg',
            ),
            const SizedBox(
              height: 48,
              child: Center(
                  child: Text(
                'Addidas....',
                style: TextStyle(fontStyle: FontStyle.italic, fontSize: 24),
              )),
            ),
            Image.network(
              'https://s.yimg.com/ny/api/res/1.2/WT0lGo9_3S4M0aw9Fiw.cQ--/YXBwaWQ9aGlnaGxhbmRlcjt3PTk2MDtoPTU2MDtjZj13ZWJw/https://s.yimg.com/os/creatr-uploaded-images/2021-09/ed63c2a0-0b75-11ec-bd7f-773bc0e055cb',
            ),
          ],
        ));
  }
}
