import 'package:lutfan/core/resources/data_state.dart';

abstract class ProductRepo {
  Future<DataState<Map<String, dynamic>>> getProducts();
  // Future<DataState<List<ProductEntity>>> getCategories();
}
