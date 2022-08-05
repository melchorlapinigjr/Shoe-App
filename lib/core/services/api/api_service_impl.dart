import 'package:dio/dio.dart';
import 'package:flutter_shoe_app/core/services/api/api_service.dart';
import 'package:flutter_shoe_app/models/category_object.dart';
import 'package:flutter_shoe_app/utils/constants.dart';
import 'package:flutter_shoe_app/views/home/shoe_object.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ApiService)
class ApiServiceImpl extends ApiService {
  static BaseOptions options = BaseOptions(baseUrl: baseUrl);

  Dio dio = Dio(options)
    ..options.headers.addEntries([
      const MapEntry('accept', 'application/json'),
    ]);

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
}
