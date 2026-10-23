import 'package:bookia_app/core/networking/api_endpoint.dart';
import 'package:bookia_app/core/networking/dio_factory.dart';
import 'package:bookia_app/feature/home/data/models/book_model.dart';
import 'package:dio/dio.dart';

class HomeRepo {
  static Dio dio = Dio();

  static Future<BookModel?> getBestSellerBooks() async {
    try {
      final response = await DioFactory.dio?.get(ApiEndpoint.bestSellerBooks);
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

  static Future<List<Products?>?> search(String text) async {
    try {
      final response = await DioFactory.dio?.get(
        ApiEndpoint.search,
        queryParameters: {"name": text},
      );
      if (response?.statusCode == 200) {
        BookModel bookModel = BookModel.fromJson(response?.data);
        return bookModel.data?.products;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
