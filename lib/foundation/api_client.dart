
import 'package:hooks_riverpod/hooks_riverpod.dart';

final apiClientProvider = Provider<APIClient>((ref) => APIClientImplements());

abstract class APIClient {
  Future<T> call<T>({T? defaultValue});
}

class APIClientImplements implements APIClient {
  @override
  Future<T> call<T>({T? defaultValue}) {
    throw UnimplementedError();
  }
}
