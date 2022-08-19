import 'package:equatable/equatable.dart';

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
      this.quantity});

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "images": images,
        "sizes": sizes,
        "product_id": productId,
        "user_id": userId,
        "quantity": quantity,
      };

  factory CartObject.fromJson(Map<String, dynamic> json) => CartObject(
      id: json["id"] as int,
      name: json["name"] as String,
      description: json["description"] as String,
      price: json["price"].toDouble(),
      images: List.from(json["images"]),
      sizes: List.from(json["sizes"]),
      category: json["category"] as String,
      productId: json["product_id"].toInt(),
      userId: json["user_id"].toInt(),
      quantity: json["quantity"].toInt());

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
