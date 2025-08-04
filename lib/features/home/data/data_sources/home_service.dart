import 'package:dio/dio.dart';
import 'package:lutfan/features/home/domain/entities/category_entity.dart';
import 'package:lutfan/features/home/domain/entities/home_entity.dart';
import 'package:retrofit/retrofit.dart';
import 'package:lutfan/core/network/urls.dart';

part 'home_service.g.dart';

@RestApi(baseUrl: Urls.baseURl)
abstract class HomeService {
  factory HomeService(Dio dio, {String baseUrl}) = _HomeService;

  factory HomeService.create() {
    final dio = Dio();
    return HomeService(dio);
  }

  @GET("product")
  Future<HttpResponse<List<ProductEntity>>> getProducts();

  @GET("category")
  Future<HttpResponse<List<CategoryEntity>>> getCategories();
}
