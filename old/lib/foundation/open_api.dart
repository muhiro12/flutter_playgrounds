import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:openapi/openapi.dart';

final Provider<DefaultApi> openApiProvider = Provider<DefaultApi>((_) {
  final options = BaseOptions(baseUrl: Openapi.basePath);
  final dio = Dio(options);
  return DefaultApi(dio, serializers);
});
