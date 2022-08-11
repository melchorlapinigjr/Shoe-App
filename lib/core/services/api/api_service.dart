import 'package:flutter_shoe_app/models/category_object.dart';
import 'package:flutter_shoe_app/views/home/shoe_object.dart';

abstract class ApiService{
  Future <List<Shoe>> getShoes();
  Future <List<CategoryObject>> getShoesCategory();
  Future <List<Shoe>> getShoesByCategory(String category);
  Future<void> facebookLogin();
  Future<void> googleSignIn();
}