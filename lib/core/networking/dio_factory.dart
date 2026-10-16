import 'package:dio/dio.dart';

class DioFactory {
  static Dio? dio;
  static void init() {
    dio = Dio(BaseOptions(baseUrl: "https://codingarabic.eraapro.com/api/"));
  }
}
