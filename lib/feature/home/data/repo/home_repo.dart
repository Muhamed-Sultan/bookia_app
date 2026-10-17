import 'package:bookia_app/core/networking/dio_factory.dart';
import 'package:bookia_app/core/utils/validator/app_constants.dart';
import 'package:bookia_app/feature/home/data/models/book_model.dart';
import 'package:dio/dio.dart';

class HomeRepo {
  static Dio dio = Dio();

  static Future<BookModel?>? getBestSellerBooks() async {
    try {
      final response = await DioFactory.dio?.get('products-bestseller');
      if (response?.statusCode == 200) {
        BookModel book = BookModel.fromJson(response?.data);
        return book;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
