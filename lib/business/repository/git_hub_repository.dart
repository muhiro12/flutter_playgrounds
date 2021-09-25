// Project imports:
import 'package:flutter_playgrounds/data/data_source/open_api_data_source.dart';

abstract class GitHubRepository {
  Future<List<String>> gitignoreTemplates();
}

class GitHubRepositoryImplements implements GitHubRepository {
  final OpenApiDataSource _dataSource = OpenApiDataSourceImplements();

  @override
  Future<List<String>> gitignoreTemplates() {
    return _dataSource.gitignoreTemplates();
  }
}
