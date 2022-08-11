import 'package:flutter_shoe_app/models/user_object.dart';

abstract class SharedPreference {
  Future<void> setUser(User user);
  Future<User> getUser();
  Future<void> logOut();
}
