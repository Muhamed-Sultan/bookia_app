import 'package:dio/dio.dart';
import 'package:bookia_app/core/networking/api_endpoint.dart';

class DioFactory {
  static Dio? dio;
  static void init() {
    dio = Dio(BaseOptions(baseUrl: ApiEndpoint.baseUrl));
  }
}
