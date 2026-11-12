import 'package:dio/dio.dart';
/// Centralized error-to-message mapper for Bookia API requests.
///
/// Usage:
///   try {
///     await dio.get('/books');
///   } on DioException catch (error) {
///     final message = ErrorHandler.handle(error);
///   }
class ErrorHandler {
  ErrorHandler._();

  /// Converts an exception into a user-friendly message.
  static String handle(Object error) {
    if (error is DioException) {
      return _handleDioError(error);
    }

    if (error is FormatException) {
      return 'Received data in an invalid format. Please try again.';
    }

    return 'Something went wrong. Please try again.';
  }

  static String _handleDioError(DioException error) {
    // Prefer a meaningful message returned by the backend, when available.
    final serverMessage = _extractServerMessage(error.response?.data);
    if (serverMessage != null && serverMessage.isNotEmpty) {
      return serverMessage;
    }

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return 'The connection timed out. Please try again.';

      case DioExceptionType.connectionError:
        return 'No internet connection. Please check your network.';

      case DioExceptionType.badCertificate:
        return 'A secure connection could not be established.';

      case DioExceptionType.cancel:
        return 'The request was cancelled.';

      case DioExceptionType.badResponse:
        return _handleStatusCode(error.response?.statusCode);

      case DioExceptionType.unknown:
        return 'Unable to connect right now. Please try again.';
      case DioExceptionType.transformTimeout:
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  }

  static String _handleStatusCode(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'Invalid request. Please check the entered information.';
      case 401:
        return 'Your session has expired. Please log in again.';
      case 403:
        return 'You do not have permission to perform this action.';
      case 404:
        return 'The requested item could not be found.';
      case 408:
        return 'The request took too long. Please try again.';
      case 422:
        return 'Some of the entered information is invalid.';
      case 429:
        return 'Too many requests. Please wait a moment and try again.';
      case 500:
      case 501:
      case 502:
      case 503:
      case 504:
        return 'A server error occurred. Please try again later.';
      default:
        if (statusCode != null && statusCode >= 500) {
          return 'A server error occurred. Please try again later.';
        }
        return 'The request failed. Please try again.';
    }
  }

  /// Supports common API response formats, for example:
  /// {"message": "..."}, {"error": "..."}, or {"errors": {"email": ["..."]}}.
  static String? _extractServerMessage(dynamic data) {
    if (data is String) {
      final value = data.trim();
      return value.isEmpty ? null : value;
    }

    if (data is Map) {
      for (final key in ['message', 'error', 'detail', 'description']) {
        final value = data[key];
        if (value is String && value.trim().isNotEmpty) {
          return value.trim();
        }
      }

      final errors = data['errors'];
      if (errors is Map) {
        for (final value in errors.values) {
          if (value is String && value.trim().isNotEmpty) {
            return value.trim();
          }
          if (value is List && value.isNotEmpty) {
            final first = value.first;
            if (first is String && first.trim().isNotEmpty) {
              return first.trim();
            }
          }
        }
      }
    }

    return null;
  }
}



/*
import 'package:dio/dio.dart';

class ApiErrorHandler {
  ApiErrorHandler._();

  /// يحوّل أي DioException إلى رسالة مفهومة للمستخدم
  static String handleDioException(DioException error) {
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

  /// يحوّل كود الحالة (HTTP status code) إلى رسالة
  static String _handleStatusCode(int? statusCode) {
    if (statusCode == null) {
      return 'Unexpected response from server.';
    }

    switch (statusCode) {
      case 400:
        return 'Bad request. Please check your input.';

      case 401:
        return 'Unauthorized. Please login again.';

      case 403:
        return 'You do not have permission to access this resource.';

      case 404:
        return 'Requested resource was not found.';

      case 405:
        return 'This request method is not allowed.';

      case 408:
        return 'Request timeout. Please try again.';

      case 409:
        return 'Conflict occurred.';

      case 422:
        return 'Invalid data. Please check your input.';

      case 429:
        return 'Too many requests. Please try again later.';

      default:
        if (statusCode >= 500) {
          return 'Server error. Please try again later.';
        }
        if (statusCode >= 400) {
          return 'Request failed. Please check your input.';
        }
        return 'Unexpected response from server.';
    }
  }
}
*/