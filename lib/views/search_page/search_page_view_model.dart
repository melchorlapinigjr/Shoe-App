import 'package:flutter/material.dart';
import 'package:flutter_shoe_app/views/home/home_view_model.dart';
import 'package:flutter_shoe_app/views/home/shoe_object.dart';

class SearchPageViewModel extends ChangeNotifier {

  final HomeViewModel homeViewModel;

  List<Shoe> foundShoes = [];

  bool hideResultCount = true;

  bool hasInput = false;

  SearchPageViewModel(this.homeViewModel);

  void initialize() {
    foundShoes = homeViewModel.items;
    notifyListeners();
  }

  void onTextChanged(String input) {
    foundShoes =  homeViewModel.items
        .where((shoe) => shoe.name!.toLowerCase().contains(input.toLowerCase()))
        .toList();
    hideResultCount = false;
    hideResultCount = input.isEmpty ? true : false;
    hasInput = input.isEmpty ? false : true;
    notifyListeners();
  }

  final searchField = TextEditingController();
}
