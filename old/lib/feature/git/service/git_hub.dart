import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../entity/gitignore.dart';
import 'git_hub_repository.dart';

final FutureProvider<List<String>> allGitignoreNamesProvider =
    FutureProvider<List<String>>((FutureProviderRef<List<String>> ref) =>
        ref.watch(gitHubRepositoryProvider).allGitignoreNames());

final FutureProviderFamily<Gitignore, String> gitignoreProvider =
    FutureProvider.family((FutureProviderRef<Gitignore> ref, String name) =>
        ref.watch(gitHubRepositoryProvider).gitignore(name));
