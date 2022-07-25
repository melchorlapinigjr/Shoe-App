import 'package:flutter/material.dart';
import 'package:flutter_shoe_app/utils/constants.dart';
import 'package:flutter_shoe_app/views/home/home_view_model.dart';
import 'package:flutter_shoe_app/views/home/shoe_category_view.dart';
import 'package:flutter_shoe_app/views/home/shoe_horizontal_item.dart';
import 'package:flutter_shoe_app/views/home/shoe_vertical_item.dart';
import 'package:flutter_shoe_app/views/search_page/search_page.dart';

import 'package:stacked/stacked.dart';

class HomepageView extends StatefulWidget {
  const HomepageView({Key? key}) : super(key: key);

  @override
  State<HomepageView> createState() => _HomepageViewState();
}

class _HomepageViewState extends State<HomepageView> {
  @override
  void initState() {
    super.initState();
    //colors = [];
    //_currentIndex =0;
    //_updatePalettes();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(),
        builder: (context, viewModel, child) {
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
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const SearchPage()));
                  },
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
                    physics: const BouncingScrollPhysics(),
                    children: const <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(kDefaultPaddin, 0, 0, 0),
                        child: Text(
                          'Shoes',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 26,
                          ),
                        ),
                      ),
                      ShoeCategoryView(),
                    ],
                  ),
                ),
                Flexible(
                  child: SizedBox(
                    height: 304,
                    child: ListView.separated(
                      padding: const EdgeInsets.all(16),
                      scrollDirection: Axis.horizontal,
                      itemCount: viewModel.items.length,
                      separatorBuilder: (context, _) =>
                          const SizedBox(width: 16),
                      itemBuilder: (context, index) => ShoeHorizontalItem(
                        viewModel.items[index],
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
                          '${viewModel.items.length.toString()} OPTIONS',
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
                  itemCount: viewModel.items.length,
                  separatorBuilder: (context, _) => const Divider(
                    color: Color(0xffF4F4F4),
                    height: 1,
                    thickness: 1,
                    indent: 10,
                    endIndent: 10,
                  ),
                  itemBuilder: (context, index) => ShoeVerticalItem(
                    item: viewModel.items[index],
                  ),
                ),
              ]),
            ),
            backgroundColor: Colors.white,
          );
        });
  }
}



