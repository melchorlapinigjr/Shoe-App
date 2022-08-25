import 'package:flutter/material.dart';
import 'package:flutter_shoe_app/app/app.locator.dart';
import 'package:flutter_shoe_app/core/services/navigation/navigation_service.dart';
import 'package:flutter_shoe_app/models/shoe_object.dart';

class SearchPageViewModel extends ChangeNotifier {
  final List<Shoe> items;

  List<Shoe> foundShoes = [];

  bool hideResultCount = true;

  bool hasInput = false;

  SearchPageViewModel(this.items);
  final NavigationService navigationService = locator<NavigationService>();

  void initialize() {
    foundShoes = items;
    notifyListeners();
  }

  void onTextChanged(String input) {
    foundShoes = items
        .where((shoe) => shoe.name!.toLowerCase().contains(input.toLowerCase()))
        .toList();
    hideResultCount = false;
    hideResultCount = input.isEmpty ? true : false;
    hasInput = input.isEmpty ? false : true;
    notifyListeners();
  }

  final searchField = TextEditingController();
}
