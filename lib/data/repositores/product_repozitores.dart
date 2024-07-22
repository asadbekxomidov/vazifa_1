import 'package:vazifa_1/data/models/product.dart';
import 'package:vazifa_1/services/product_services.dart';

class ProductsRepository {
  final DioProductsService _dioProductsService;

  ProductsRepository({required DioProductsService dioProductsService})
      : _dioProductsService = dioProductsService;

  Future<List<Product>> getProducts() async {
    return await _dioProductsService.getProducts();
  }

  Future<void> deleteProducts(String id) async {
    return await _dioProductsService.deleteProduct(id);
  }
}
