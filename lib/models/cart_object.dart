import 'package:equatable/equatable.dart';
import 'package:flutter_shoe_app/models/shoe_object.dart';

class CartObject extends Equatable {
  int? id;
  int? productId;
  int? userId;
  int? quantity;
  Shoe? shoe;

  CartObject(
      {this.id,
      this.productId,
      this.userId,
      this.quantity,
      this.shoe});

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "user_id": userId,
        "quantity": quantity,
      };

  factory CartObject.fromJson(Map<String, dynamic> json) => CartObject(
        id: json["id"] as int,
        userId: int.parse(json["user_id"]),
        productId: json["product_id"] as int,
        quantity: json["quantity"] as int,
        shoe: Shoe(
          id: json["product_id"] as int?,
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
        shoe,
        productId,
        userId,
        quantity
      ];
}
