import 'dart:math';

import '../api_client.dart';
import '../app_exception.dart';

class APIClientMock implements APIClient {
  @override
  Future<T> call<T>({T? defaultValue}) async {
    if (defaultValue == null) {
      throw AppException.other();
    }

    await Future<void>.delayed(Duration(seconds: Random().nextInt(3)));

    final code = Random().nextInt(501);
    if (code >= 400) {
      throw AppException.http(code);
    }

    return defaultValue;
  }
}
