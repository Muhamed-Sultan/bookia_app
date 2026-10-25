import 'package:bookia_app/core/networking/api_endpoint.dart';
import 'package:bookia_app/core/networking/dio_factory.dart';
import 'package:bookia_app/feature/book_details/data/models/book_details_model.dart';

import 'package:flutter/foundation.dart';

class BookDetailsRepo {
  static Future<BookDetailsModel?> getBookDetails(int id) async {
    try {
      final response = await DioFactory.dio?.get(
        "${ApiEndpoint.bookDetails}$id",
      );
      if (response?.statusCode == 200 && response?.data != null) {
        return BookDetailsModel.fromJson(
          response!.data is Map<String, dynamic>
              ? response.data
              : Map<String, dynamic>.from(response.data as Map),
        );
      } else {
        return null;
      }
    } catch (e) {
      debugPrint('Error getting book details: $e');
      return null;
    }
  }
}
