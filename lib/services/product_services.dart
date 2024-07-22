import 'package:dio/dio.dart';
import 'package:vazifa_1/core/dio_client.dart';
import 'package:vazifa_1/data/models/product.dart';


class DioProductsService {
  final _dioClient = DioClient();

  Future<List<Product>> getProducts() async {
    try {
      final response = await _dioClient.get(url: "https://api.escuelajs.co/api/v1/products");

      List<Product> products = [];

      for (var userData in response.data) {
        products.add(Product.fromMap(userData));
      }

      return products;
    } on DioException catch (e) {
      print(e.response?.data);
      rethrow;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> deleteProduct(String id) async {
    try {
      await _dioClient.delete('https://api.escuelajs.co/api/v1/products/$id');
      
    } on DioException catch (e) {
      print(e);
    } catch (e) {
      print("");
    }
  }

  
}