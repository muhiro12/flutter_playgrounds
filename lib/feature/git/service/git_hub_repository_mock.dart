import '../entity/gitignore.dart';
import 'git_hub_repository.dart';

class GitHubRepositoryMock implements GitHubRepository {
  @override
  Future<List<String>> allGitignoreNames() {
    return Future<void>.delayed(const Duration(seconds: 1)).then(
      (_) => const <String>[
        'Actionscript',
        'Android',
        'AppceleratorTitanium',
        'Autotools',
        'Bancha',
        'C',
        'C++',
      ],
    );
  }

  @override
  Future<Gitignore> gitignore(String name) {
    return Future<void>.delayed(const Duration(seconds: 1)).then(
      (_) => Gitignore(
        name: name,
        source:
            '# Object files\n*.o\n\n# Libraries\n*.lib\n*.a\n\n# Shared objects (inc. Windows DLLs)\n*.dll\n*.so\n*.so.*\n*.dylib\n\n# Executables\n*.exe\n*.out\n*.app\n',
      ),
    );
  }
}
