import 'package:built_collection/built_collection.dart';
import 'package:dio/dio.dart';
import 'package:flutter_playgrounds/data/entity/gitignore.dart';
import 'package:flutter_playgrounds/data/model/open_api.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:openapi/openapi.dart';

final Provider<GitHubRepository> gitHubRepositoryProvider =
    Provider<GitHubRepository>((ProviderRef<GitHubRepository> ref) {
  final DefaultApi api = ref.watch(openApiProvider);
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
      final BuiltList<String>? data = response.data;
      if (data == null) {
        // TODO(nakano): Use app error
        throw Exception();
      }
      return data.toList();
    });
  }

  @override
  Future<Gitignore> gitignore(String name) {
    return _api
        .gitignoreTemplatesNameGet(name: name)
        .then((Response<InlineResponse200> response) {
      final InlineResponse200? data = response.data;
      if (data == null) {
        // TODO(nakano): Use app error
        throw Exception();
      }
      return Gitignore(name: data.name, source: data.source_);
    });
  }
}
