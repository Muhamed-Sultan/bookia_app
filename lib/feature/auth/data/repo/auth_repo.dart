import 'package:dio/dio.dart';

class AuthRepo {
  static Dio dio = Dio();

  static Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      final Response response = await dio.post(
        "path",
        data: {"email": email, "password": password},
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<bool> register({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final Response response = await dio.post(
        "path",
        data: {"email": email, "password": password, "name": name},
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
