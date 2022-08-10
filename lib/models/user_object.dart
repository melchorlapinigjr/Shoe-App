import 'dart:math';

import 'package:equatable/equatable.dart';

class User extends Equatable{

  String? name;
  String? email;
  String? password;

  User({this.name, this.email, this.password});

  Map<String, dynamic> toJson() {
    return {
    "name": name,
    "email": email,
    'password': password
  };
  }

  @override
  // TODO: implement props
  List<Object?> get props => [name,
    email,
    password];
}