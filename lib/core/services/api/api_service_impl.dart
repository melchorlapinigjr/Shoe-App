import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:flutter_shoe_app/app/app.locator.dart';
import 'package:flutter_shoe_app/core/services/api/api_service.dart';
import 'package:flutter_shoe_app/core/services/shared_preferrence/shared_preference.dart';
import 'package:flutter_shoe_app/models/cart_object.dart';
import 'package:flutter_shoe_app/models/category_object.dart';
import 'package:flutter_shoe_app/models/checkout_object.dart';

import 'package:flutter_shoe_app/models/shoe_object.dart';
import 'package:flutter_shoe_app/models/user_object.dart';
import 'package:flutter_shoe_app/utils/constants.dart';
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

  /// ******************SHOES************************************************/
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
    } catch (e) {
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
    } catch (e) {
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
    } catch (e) {
      rethrow;
    }
  }

  ///********************************END SHOES************************************************/

  /// **********************************BEGIN LOGIN********************************************/
  @override
  Future<void> facebookLogin() async {
    var fbuserdata;
    // Create an instance of FacebookLogin
    final fb = FacebookLogin();
    try {
      // Log in
      final result = await fb.expressLogin();

      if (result.status == FacebookLoginStatus.success) {
        final FacebookAccessToken? accessToken = result.accessToken;
        final body = {
          'provider': 'facebook',
          'access_token': accessToken?.token,
        };
        final response = await dio.post('/social/login', data: body);
        if (response.statusCode == 200 && response.data != null) {
          fbuserdata = User.fromJson(response.data);
          sharedPreference.setUser(fbuserdata);
        }
      } else {
        throw 'Facebook activity canceled';
      }
    } catch (e) {
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
        final body = {
          'provider': 'google',
          'access_token': googleSignInAuthentication.accessToken,
        };
        final response = await dio.post('/social/login', data: body);
        if (response.statusCode == 200 && response.data != null) {
          userdata = User.fromJson(response.data);
          sharedPreference.setUser(userdata);
        }
      } else {
        //do something
        throw 'User canceled';
      }
    } catch (e) {
      if (e is PlatformException) {
        throw e.message!;
      } else {
        throw 'Logged Canceled';
      }
    }
  }

  //register user
  @override
  Future<void> registerUser(User createUser) async {
    try {
      await dio.post('/auth/register', data: createUser.toJson());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signInWithFields(String userEmail, String userPassword) async {
    var userdata;
    try {
      final body = {
        'email': userEmail,
        'password': userPassword,
      };
      final response = await dio.post('/auth/login', data: body);
      if (response.statusCode == 200 && response.data != null) {
        userdata = User.fromJson(response.data);
        sharedPreference.setUser(userdata);
      }
    } catch (e) {
      rethrow;
    }
  }

  /// *********************************END LOGIN*****************************************************

  /// ********************************ADD SHOE********************************************/
  @override
  Future<void> addShoeItem(Shoe shoeItem) async {
    try {
      await dio.post('/addproduct', data: shoeItem.toJSON());
    } catch (e) {
      throw e.toString();
    }
  }

  /**********************************ADD SHOE********************************************/

  /// ************************BEGIN MYLIKES***************************/
  @override
  Future<List<Shoe>> getMyLikes(String userId) async {
    try {
      final response = await dio.get('/wishlist/$userId');
      if (response.statusCode == 200 && response.data != null) {
        return (response.data as List<dynamic>)
            .map((e) => Shoe.fromJson(e as Map<String, dynamic>))
            .toList();
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> removeFromLikes(Shoe shoe, User user) async {
    try {
      final body = {"user_id": user.id, "product_id": shoe.id};
      await dio.post('/removeWishlist', data: body);
    } catch (e) {
      rethrow;
    }
  }

  //add to my likes
  @override
  Future<void> addToLikes(User user, Shoe shoe) async {
    try {
      final body = {"user_id": user.id, "product_id": shoe.id};
      await dio.post('/addwishlist', data: body);
    } catch (e) {
      rethrow;
    }
  }

  /***************************END MYLIKES******************************/

  /// ************BEGIN CART****************************/
  @override
  Future<List<CartObject>> myCart(User user) async {
    try {
      final response = await dio.get('/cart/${user.id}');
      if (response.statusCode == 200 && response.data != null) {
        return (response.data as List<dynamic>)
            .map((e) => CartObject.fromJson(e as Map<String, dynamic>))
            .toList();
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> addToMyCart(CartObject cartObject) async {
    try {
      await dio.post('/addtocart', data: cartObject.toJson());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> removeFromMyCart(CartObject cartObject) async {
    try {
      await dio.post('/subtractquantity', data: cartObject.toJson());
    } catch (e) {
      rethrow;
    }
  }

/// Checkout
  @override
  Future<void> checkOut(CheckoutObject checkoutObject) async {
    try{
      await dio.post('/checkout', data: checkoutObject.toJson());
    } catch (e){
      rethrow;
    }
  }
}
