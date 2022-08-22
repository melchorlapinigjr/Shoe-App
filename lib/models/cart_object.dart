import 'package:equatable/equatable.dart';
import 'package:flutter_shoe_app/models/shoe_object.dart';

class CartObject extends Equatable {
  int? id;
  String? name;
  String? description;
  double? price;
  List<String>? images;
  List<String>? sizes;
  String? category;
  int? productId;
  int? userId;
  int? quantity;
  Shoe? shoe;

  CartObject(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.images,
      this.sizes,
      this.category,
      this.productId,
      this.userId,
      this.quantity,
      this.shoe});

  Map<String, dynamic> toJson() => {
        "id": id,
        "shoe": shoe!.toJSON(),
        "user_id": userId,
        "quantity": quantity,
      };

  factory CartObject.fromJson(Map<String, dynamic> json) => CartObject(
        id: json["id"] as int,
        userId: int.parse(json["user_id"]),
        quantity: json["quantity"] as int,
        shoe: Shoe(
          id: json["id"] as int?,
          name: json["name"] as String?,
          description: json["description"] as String?,
          category: json["category"] as String?,
          price: json['price'].toDouble(),
          images: List.from(json["images"]),
          sizes: List.from(json["sizes"]),
        ),
      );

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name,
        description,
        price,
        images,
        sizes,
        category,
        productId,
        userId,
        quantity
      ];
}
