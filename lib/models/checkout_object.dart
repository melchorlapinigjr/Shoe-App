import 'package:equatable/equatable.dart';

class CheckoutObject extends Equatable {
  int? id;
  int userId;
  List<int> productId;
  int quantity;
  double totalPrice;

  CheckoutObject(
      {required this.userId,
      required this.productId,
      required this.quantity,
      required this.totalPrice});

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "product_id": productId,
        "quantity": quantity,
        "total": totalPrice
      };

  @override
  List<Object?> get props => [id, userId, productId, quantity, totalPrice];
}
