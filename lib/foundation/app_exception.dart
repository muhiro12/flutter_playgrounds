import 'app_logger.dart';

enum AppExceptionType {
  http,
  error,
  other;
}

class AppException implements Exception {
  AppException._({
    required this.type,
    this.error,
    this.code,
  }) {
    logger.warn(toString());
  }

  factory AppException.http(int code) {
    return AppException._(
      type: AppExceptionType.http,
      code: code,
    );
  }

  factory AppException.error(Error error) {
    return AppException._(
      type: AppExceptionType.error,
      error: error,
    );
  }

  factory AppException.other() {
    return AppException._(
      type: AppExceptionType.other,
    );
  }

  final AppExceptionType type;
  final Error? error;
  final int? code;

  @override
  String toString() {
    switch (type) {
      case AppExceptionType.http:
        return 'Bad HTTP status (code: $code)';
      case AppExceptionType.error:
        return error.toString();
      case AppExceptionType.other:
        return 'An unknown error occurred';
    }
  }
}
