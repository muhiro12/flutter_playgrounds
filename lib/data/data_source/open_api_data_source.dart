// Package imports:
// ignore: implementation_imports
import 'package:built_collection/src/list.dart';
import 'package:dio/dio.dart';
import 'package:openapi/openapi.dart';

abstract class OpenApiDataSource {
  Future<List<String>> gitignoreTemplates();
}

class OpenApiDataSourceImplements implements OpenApiDataSource {
  OpenApiDataSourceImplements() {
    final BaseOptions options = BaseOptions(baseUrl: Openapi.basePath);
    final Dio dio = Dio(options);
    _api = DefaultApi(dio, serializers);
  }

  late final DefaultApi _api;

  @override
  Future<List<String>> gitignoreTemplates() {
    return _api
        .gitignoreTemplatesGet()
        .then((Response<BuiltList<String>> value) {
      final BuiltList<String>? data = value.data;
      if (data == null) {
        throw Exception();
      }
      return data.map((String value) => value).toList();
    });
  }
}
