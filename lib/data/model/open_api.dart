import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:openapi/openapi.dart';

final Provider<DefaultApi> openApiProvider = Provider<DefaultApi>((_) {
  final BaseOptions options = BaseOptions(baseUrl: Openapi.basePath);
  final Dio dio = Dio(options);
  return DefaultApi(dio, serializers);
});
