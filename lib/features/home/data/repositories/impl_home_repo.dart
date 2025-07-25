import 'package:ecommerceapp/core/error/exception_handler.dart';
import 'package:ecommerceapp/core/resources/data_state.dart';
import 'package:ecommerceapp/features/home/data/data_sources/home_service.dart';
import 'package:ecommerceapp/features/home/domain/entities/category_entity.dart';
import 'package:ecommerceapp/features/home/domain/entities/home_entity.dart';
import 'package:ecommerceapp/features/home/domain/repositories/home_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ImplProductRepo extends ProductRepo {
  final HomeService productService;
  SharedPreferences? preferences;

  ImplProductRepo({required this.productService});

  // Future<void> _initializePreferences() async {
  //   preferences ??= await SharedPreferences.getInstance();
  // }

  // Future<List<ProductEntity>?> _getProductsFromPreferences() async {
  //   await _initializePreferences();

  //   final List<String>? productJsonStrings = preferences?.getStringList('Products');

  //   if (productJsonStrings == null) return null;

  //   return productJsonStrings.map((productJson) {
  //     return ProductEntity.fromJson(jsonDecode(productJson));
  //   }).toList();
  // }

  // Future<void> _saveProductsToPreferences(List<ProductEntity> products) async {
  //   await _initializePreferences();

  //   final List<String> productJsonStrings = products.map((product) {
  //     return jsonEncode(product.toJson());
  //   }).toList();

  //   await preferences?.setStringList('Products', productJsonStrings);
  // }

  @override
  Future<DataState<Map<String, dynamic>>> getProducts() async {
    try {
      // Optional caching logic
      // final cached = await _getProductsFromPreferences();
      // if (cached != null && cached.isNotEmpty) {
      //   return DataSuccess<List<ProductEntity>>(data: cached);
      // }

      final response = await productService.getProducts();
      final subcategories = await productService.getCategories();
      // final List<ProductEntity> products = response.data;
      // final List<CategoryEntity> category = subcategories.data;

      final List<ProductEntity> products =
          List<ProductEntity>.from(response.data);
      final List<CategoryEntity> category =
          List<CategoryEntity>.from(subcategories.data);

      // final List<ProductEntity> products = (response.data as List)
      //     .map((json) => ProductEntity.fromJson(json))
      //     .toList();

      // final List<CategoryEntity> category = (subcategories.data as List)
      //     .map((json) => CategoryEntity.fromJson(json))
      //     .toList();

      print('Products: $products');
      print('Categories: $category');
      // await _saveProductsToPreferences(products);

      // return DataSuccess<<Map<List<ProductEntity>>>(data: {products, category});
      return DataSuccess<Map<String, dynamic>>(data: {
        'products': products,
        'category': category,
      });
    } catch (e) {
      print(e);
      return DataException.getError<Map<String, dynamic>>(e);
    }
  }
}
