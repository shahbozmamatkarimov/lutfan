// import 'package:dio/dio.dart';
// import 'package:pretty_dio_logger/pretty_dio_logger.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class DioManager {
  // static Future<Dio> getDio() async {
  //   final dio = Dio();
  //   final preferences = await SharedPreferences.getInstance();
  //   final token = preferences.getString('token') ?? '';

  //   dio.interceptors.addAll([
  //     PrettyDioLogger(
  //       requestHeader: true,
  //       requestBody: true,
  //       responseBody: true,
  //       responseHeader: false,
  //       error: true,
  //       compact: true,
  //     ),
  //   ]);

  //   dio.options.followRedirects = true;
  //   dio.options.maxRedirects = 5;
  //   dio.options.contentType = 'application/json';
  //   dio.options.headers['Authorization'] = 'Bearer $token';
  //   dio.options.headers.addAll({
  //     "Accept": "application/json",
  //   });

  //   return dio;
  // }
}