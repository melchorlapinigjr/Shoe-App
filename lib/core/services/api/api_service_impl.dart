import 'package:dio/dio.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:flutter_shoe_app/app/app.locator.dart';
import 'package:flutter_shoe_app/core/services/api/api_service.dart';
import 'package:flutter_shoe_app/core/services/shared_preferrence/shared_preference.dart';
import 'package:flutter_shoe_app/models/category_object.dart';
import 'package:flutter_shoe_app/models/user_object.dart';
import 'package:flutter_shoe_app/utils/constants.dart';
import 'package:flutter_shoe_app/views/home/shoe_object.dart';
import 'package:google_sign_in/google_sign_in.dart';
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
  Future<void> facebookLogin() async {
    try {
      // Create an instance of FacebookLogin
      final fb = FacebookLogin();

      // Log in
      final result = await fb.expressLogin();

      if (result.status == FacebookLoginStatus.success) {
        final FacebookAccessToken? accessToken = result.accessToken;
        print(true);
        print('Access token: ${accessToken?.token}');

        final body = {
          'provider': 'facebook',
          'access_token': accessToken?.token,
        };
        final response = await dio.post('/social/login', data: body);

        if (response.statusCode == 200 && response.data != null) {
          print(true);
          print('Access token: ${accessToken?.token}');
        }
      }
    } catch (error) {
      print(error);
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
