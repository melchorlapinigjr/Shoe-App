import 'package:equatable/equatable.dart';
import 'package:palette_generator/palette_generator.dart';

//model class for per card values
class Shoe extends Equatable {
  // final String image;
  // final String title;
  // final double price;
  // final Color backgroundColor;
  // final Color titleColor;
  // PaletteColor? paletteColor;
  // final List<String> availableSizes;
  // bool isLiked;
  //
  // static String shoeDescription =
  //     "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
  //
  // Shoe({
  //   this.paletteColor,
  //   required this.image,
  //   required this.title,
  //   required this.price,
  //   required this.backgroundColor,
  //   required this.titleColor,
  //   this.availableSizes = const [],
  //   this.isLiked = false,
  // });
  //
  // @override
  // List<Object?> get props => [
  //       paletteColor,
  //       image,
  //       title,
  //       price,
  //       backgroundColor,
  //       titleColor,
  //       isLiked,
  //     ];

  int? id;
  String? name;
  String? description;
  String? category;
  double? price;
  List<String>? images;
  List<String>? sizes;
  DateTime? created_at;
  DateTime? updated_at;
  PaletteColor? paletteColor;
  bool isLiked;

  Shoe({this.id,
    this.name,
    this.description,
    this.category,
    this.price,
    this.images,
    this.sizes,
    this.created_at,
    this.updated_at,
    this.paletteColor,
    this.isLiked = false});

  Map<String, dynamic> toJSON() =>
      {
        "id": id,
        "name": name,
        "description": description,
        "category": category,
        "price": price,
        "images": images,
        "sizes": sizes,
        "created_at": created_at,
        "updated_at": updated_at,
      };



  factory Shoe.fromJson(Map<String, dynamic> json) => Shoe(
          id: json["id"] as int?,
          name: json["name"] as String?,
          description: json["description"] as String?,
          category: json["category"] as String?,
          price: json['price'].toDouble(),
          images: List.from(json["images"]),
          sizes: List.from(json["sizes"]),
          created_at: json["created_at"] != null ? DateTime.parse(
              json["created_at"]) : null,
          updated_at: json["updated_at"] != null ? DateTime.parse(
              json["updated_at"]) : null);


  @override
  // TODO: implement props
  List<Object?> get props =>
      [
        id,
        name,
        description,
        category,
        price,
        images,
        sizes,
        created_at,
        updated_at,
      ];
}
