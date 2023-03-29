import 'dart:math';

import '../../../business/model/app_exception.dart';
import '../api_client.dart';

class FakeAPIClient implements APIClient {
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
