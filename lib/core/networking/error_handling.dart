import 'package:dio/dio.dart';

class ErrorHandler {
  ErrorHandler._();

  static String handleDioException(DioException error) {
    // First: Get error message from API
    final responseData = error.response?.data;

    if (responseData is Map) {
      if (responseData['message'] != null) {
        return responseData['message'].toString();
      }

      if (responseData['error'] != null) {
        return responseData['error'].toString();
      }

      // Handle validation errors
      if (responseData['errors'] is Map) {
        final errors = responseData['errors'] as Map;

        if (errors.isNotEmpty) {
          final firstError = errors.values.first;

          if (firstError is List && firstError.isNotEmpty) {
            return firstError.first.toString();
          }

          return firstError.toString();
        }
      }
    }

    // Second: Handle Dio errors
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return 'Connection timeout. Please try again.';

      case DioExceptionType.sendTimeout:
        return 'Sending request took too long.';

      case DioExceptionType.receiveTimeout:
        return 'Receiving response took too long.';

      case DioExceptionType.badCertificate:
        return 'Invalid server certificate.';

      case DioExceptionType.badResponse:
        return _handleStatusCode(error.response?.statusCode);

      case DioExceptionType.cancel:
        return 'Request was cancelled.';

      case DioExceptionType.connectionError:
        return 'No internet connection. Please check your network.';

      case DioExceptionType.transformTimeout:
        return 'Processing server response took too long.';

      case DioExceptionType.unknown:
        return 'Something went wrong. Please try again.';
    }
  }

  static String _handleStatusCode(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'Bad request.';

      case 401:
        return 'Unauthorized.';

      case 403:
        return 'Access denied.';

      case 404:
        return 'Resource not found.';

      case 409:
        return 'Conflict occurred.';

      case 422:
        return 'Invalid data.';

      case 429:
        return 'Too many requests.';

      default:
        if (statusCode != null && statusCode >= 500) {
          return 'Server error. Please try again later.';
        }

        return 'Something went wrong.';
    }
  }
}
