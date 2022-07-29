import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_shoe_app/utils/constants.dart';
import 'package:flutter_shoe_app/views/home/home_view_model.dart';
import 'package:flutter_shoe_app/views/home/shoe_category_view.dart';
import 'package:flutter_shoe_app/views/home/shoe_horizontal_item.dart';
import 'package:flutter_shoe_app/views/home/shoe_vertical_item.dart';
import 'package:stacked/stacked.dart';

class HomeViewWidget extends ViewModelWidget<HomeViewModel> {
  const HomeViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return SingleChildScrollView(
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
              separatorBuilder: (context, _) => const SizedBox(width: 16),
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
    );
  }
}
