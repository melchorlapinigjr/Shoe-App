import 'dart:convert';

import 'package:flutter_shoe_app/core/services/shared_preferrence/shared_preference.dart';
import 'package:flutter_shoe_app/models/user_object.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceImpl extends SharedPreference {
  @override
  Future<User> getUser() async {
    final sharePref = await SharedPreferences.getInstance();
    final String? value = sharePref.getString('userPrefKey');

    final jsonFile = json.decode(value!);
    final user = User.fromJson(jsonFile as Map<String, dynamic>);
    return user;
  }

  @override
  Future<void> setUser(User user) async {
    final sharePref = await SharedPreferences.getInstance();
    sharePref.setString('userPrefKey', json.encode(user.toJson()));
  }

  @override
  Future<void> logOut() async {
    final sharePref = await SharedPreferences.getInstance();
    sharePref.remove('userPrefKey');
  }
}
