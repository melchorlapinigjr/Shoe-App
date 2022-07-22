import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class PaletteUtils {
  PaletteUtils._();
  //update Palette per image
  static Future<PaletteColor> getColorFromImage(String imagePath) async {
    //item.image;
    PaletteGenerator generator = await PaletteGenerator.fromImageProvider(
      AssetImage(imagePath),
      size: const Size(256, 170),
    );

    return generator.darkVibrantColor ?? PaletteColor(Colors.blue, 100);
//       return generator.dominantColor ?? PaletteColor(Colors.blue, 100);
  }
}