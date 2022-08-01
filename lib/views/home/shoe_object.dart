import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:palette_generator/palette_generator.dart';

//model class for per card values
class Shoe extends Equatable {
  final String image;
  final String title;
  final double price;
  final Color backgroundColor;
  final Color titleColor;
  PaletteColor? paletteColor;

  static String shoeDescription =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

  Shoe({
    this.paletteColor,
    required this.image,
    required this.title,
    required this.price,
    required this.backgroundColor,
    required this.titleColor,
  });

  @override
  List<Object?> get props => [
        paletteColor,
        image,
        title,
        price,
        backgroundColor,
        titleColor,
      ];
}
