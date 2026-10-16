import 'package:bookia_app/core/networking/dio_factory.dart';
import 'package:bookia_app/core/services/locale/shared_local.dart';
import 'package:bookia_app/core/utils/validator/app_constants.dart';
import 'package:dio/dio.dart';

class AuthRepo {
  static Dio dio = Dio();

  static Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await DioFactory.dio?.post(
        'login',
        data: {"email": email, "password": password},
      );
      if (response?.statusCode == 200) {
        String? token = response?.data["data"]["token"];
        saveToken(token ?? "");
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  static saveToken(String token) async {
    await SharedLocal.prefs?.setString(AppConstants.Token, token);
  }

  static Future<bool> register({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final response = await DioFactory.dio?.post(
        'register',
        data: {
          'name': name,
          'email': email,
          'password': password,
          'password_confirmation': password,
        },
      );

      return response?.statusCode == 200 || response?.statusCode == 201;
    } on DioException catch (e) {
      return false;
    }
  }
}
