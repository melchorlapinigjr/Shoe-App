import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shoe_app/utils/constants.dart';
import 'package:flutter_shoe_app/views/home/home_view_model.dart';
import 'package:stacked/stacked.dart';

class ShoeCategory extends ViewModelWidget<HomeViewModel> {
  const ShoeCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        height: 25,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: viewModel.categories.length,
          itemBuilder: (context, index) => CategoryItem(
            category: viewModel.categories[index],
          ),
        ),
      ),
    );
  }
}

class CategoryItem extends ViewModelWidget<HomeViewModel> {
  final String category;

  const CategoryItem({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    bool isSelected = viewModel.selectedCategory == category;

    return InkWell(
      onTap: ()=>viewModel.onCategorySelected(category),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
        child: Container(
          decoration: BoxDecoration(
              color: isSelected ? Colors.black : Colors.black12,
              border: Border.all(color: Colors.black26),
              borderRadius: const BorderRadius.all(Radius.circular(18))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(left: 8.0, right: 8.0),
                alignment: Alignment.center,
                child: Text(
                  category,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 16,
                    color: isSelected ? kTextColor : kTextLightColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
