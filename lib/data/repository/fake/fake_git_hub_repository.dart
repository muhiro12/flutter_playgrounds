// Project imports:
import 'package:flutter_playgrounds/data/entity/gitignore.dart';
import 'package:flutter_playgrounds/data/repository/git_hub_repository.dart';

class FakeGitHubRepository implements GitHubRepository {
  @override
  Future<List<Gitignore>> gitignoreTemplates() {
    return Future<void>.delayed(const Duration(seconds: 1)).then(
      (_) => const <Gitignore>[
        Gitignore('ignore_a'),
        Gitignore('ignore_b'),
        Gitignore('ignore_c'),
      ],
    );
  }
}
