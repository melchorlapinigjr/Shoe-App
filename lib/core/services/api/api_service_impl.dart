import 'package:dio/dio.dart';
import 'package:flutter_shoe_app/app/app.locator.dart';
import 'package:flutter_shoe_app/core/services/api/api_service.dart';
import 'package:flutter_shoe_app/core/services/shared_preferrence/shared_preference.dart';
import 'package:flutter_shoe_app/models/category_object.dart';
import 'package:flutter_shoe_app/models/user_object.dart';
import 'package:flutter_shoe_app/utils/constants.dart';
import 'package:flutter_shoe_app/views/home/shoe_object.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_shoe_app/views/login/log_in_register.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ApiService)
class ApiServiceImpl extends ApiService {
  static BaseOptions options = BaseOptions(baseUrl: baseUrl);

  Dio dio = Dio(options)
    ..options.headers.addEntries([
      const MapEntry('accept', 'application/json'),
    ]);

  //GoogleSignIn
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  final SharedPreference sharedPreference = locator<SharedPreference>();

  @override
  Future<List<Shoe>> getShoes() async {
    try {
      final response = await dio.get('/products');
      if (response.statusCode == 200 && response.data != null) {
        return (response.data as List<dynamic>)
            .map((e) => Shoe.fromJson(e as Map<String, dynamic>))
            .toList();
      }
      return [];
    } catch (e, stackTrace) {
      print((stackTrace));
      rethrow;
    }
  }

  @override
  Future<List<CategoryObject>> getShoesCategory() async {
    try {
      final response = await dio.get('/products/category');
      if (response.statusCode == 200 && response.data != null) {
        return (response.data as List<dynamic>)
            .map((e) => CategoryObject.fromJson(e as Map<String, dynamic>))
            .toList();
      }
      return [];
    } catch (e, stackTrace) {
      print((stackTrace));
      rethrow;
    }
  }

  @override
  Future<List<Shoe>> getShoesByCategory(String category) async {
    try {
      final response = await dio.get('/products/category/$category');
      if (response.statusCode == 200 && response.data != null) {
        return (response.data as List<dynamic>)
            .map((e) => Shoe.fromJson(e as Map<String, dynamic>))
            .toList();
      }
      return [];
    } catch (e, stackTrace) {
      print((stackTrace));
      rethrow;
    }
  }

  @override
  Future<void> getLoginRegister(String name, String email, String password) async {
    final body ={
      'name': name,
      'email': email,
      'password': password
    };
    try {
      final response = await dio.post('/auth/register', data: body );
      if(response == 200 && response != null){
        print('success');
      }
      else{
        print('failed');
      }
    }catch(e){
      print(e);
    }
  }

  @override
  Future<void> googleSignIn() async {
    var userdata;
    try {
      await _googleSignIn.signOut();
      final GoogleSignInAccount? result = await _googleSignIn.signIn();
      if (result != null) {
        GoogleSignInAuthentication googleSignInAuthentication =
            await result.authentication;
        print(googleSignInAuthentication.accessToken);
        final body = {
          'provider': 'google',
          'access_token': googleSignInAuthentication.accessToken,
        };
        final response = await dio.post('/social/login', data: body);
        print(response.data.toString());
        if (response.statusCode == 200 && response.data != null) {
          userdata = User.fromJson(response.data);
          sharedPreference.setUser(userdata);
        }
      }
    } catch (e, stackTrace) {
      print((stackTrace));
      rethrow;
    }
  }
}
