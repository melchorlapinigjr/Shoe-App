import 'package:equatable/equatable.dart';

class WishlistObject extends Equatable {
  WishlistObject(
      {this.wishlistId,
      this.productId,
      this.userId,
      this.name,
      this.image,
      this.price});

  String? wishlistId;
  String? productId;
  String? userId;
  String? name;
  List<String>? image;
  double? price;

  Map<String, dynamic> toJson() => {"product_id": productId};

  factory WishlistObject.fromJson(Map<String, dynamic> json) => WishlistObject(
        productId: json['id'].toString(),
        name: json['name'] as String?,
        image: List.from(json['images']),
        price: json['price'].toDouble(),
      );

  @override
  // TODO: implement props
  List<Object?> get props =>
      [wishlistId, productId, userId, name, image, price];
}
