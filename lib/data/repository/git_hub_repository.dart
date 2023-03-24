import 'package:built_collection/built_collection.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:openapi/openapi.dart';

import '../../business/model/app_exception.dart';
import '../entity/gitignore.dart';
import '../model/open_api.dart';

final Provider<GitHubRepository> gitHubRepositoryProvider =
    Provider<GitHubRepository>((ProviderRef<GitHubRepository> ref) {
  final api = ref.watch(openApiProvider);
  return GitHubRepositoryImplements(api);
});

abstract class GitHubRepository {
  Future<List<String>> allGitignoreNames();
  Future<Gitignore> gitignore(String name);
}

class GitHubRepositoryImplements implements GitHubRepository {
  GitHubRepositoryImplements(this._api);

  final DefaultApi _api;

  @override
  Future<List<String>> allGitignoreNames() {
    return _api
        .gitignoreTemplatesGet()
        .then((Response<BuiltList<String>> response) {
      final data = response.data;
      if (data == null) {
        throw AppException();
      }
      return data.toList();
    });
  }

  @override
  Future<Gitignore> gitignore(String name) {
    return _api
        .gitignoreTemplatesNameGet(name: name)
        .then((Response<InlineResponse200> response) {
      final data = response.data;
      if (data == null) {
        throw AppException();
      }
      return Gitignore(name: data.name, source: data.source_);
    });
  }
}
