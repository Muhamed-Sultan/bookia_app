import 'package:bookia_app/core/networking/api_endpoint.dart';
import 'package:bookia_app/core/networking/dio_factory.dart';
import 'package:bookia_app/feature/book_details/data/models/book_details_model.dart';

class BookDetailsRepo {
  static Future<BookDetailsModel?> getBookDetails(int id) async {
    try {
      final response = await DioFactory.dio?.get(
        "${ApiEndpoint.bookDetails}$id",
      );
      if (response?.statusCode == 200) {
        BookDetailsModel bookDetailsModel = BookDetailsModel.fromJson(
          response?.data,
        );
        return bookDetailsModel;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
