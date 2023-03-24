import 'dart:developer';

enum AppExceptionType {
  http,
  other;
}

class AppException implements Exception {
  AppException({
    this.type = AppExceptionType.other,
    this.code = 200,
  }) {
    log(toString());
  }

  final AppExceptionType type;
  final int code;

  @override
  String toString() {
    switch (type) {
      case AppExceptionType.http:
        return 'Bad HTTP status (code: $code)';
      case AppExceptionType.other:
        return 'An unknown error occurred';
    }
  }
}
