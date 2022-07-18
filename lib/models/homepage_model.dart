import 'package:flutter/material.dart';

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
