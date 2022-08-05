import 'package:equatable/equatable.dart';

class CategoryObject extends Equatable{

  String? category;

  CategoryObject({
    this.category,
  });

  factory CategoryObject.fromJson(Map<String, dynamic> json) =>
      CategoryObject(category: json["category"] as String?);

  @override
  // TODO: implement props
  List<Object?> get props => [
    category
  ];

}