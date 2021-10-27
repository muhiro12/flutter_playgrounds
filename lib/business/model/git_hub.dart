import 'package:flutter_playgrounds/data/entity/gitignore.dart';
import 'package:flutter_playgrounds/data/repository/git_hub_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final FutureProvider<List<String>> allGitignoreNamesProvider =
    FutureProvider<List<String>>((FutureProviderRef<List<String>> ref) =>
        ref.watch(gitHubRepositoryProvider).allGitignoreNames());

final FutureProviderFamily<Gitignore, String> gitignoreProvider =
    FutureProvider.family((FutureProviderRef<List<String>> ref, String name) =>
        ref.watch(gitHubRepositoryProvider).gitignore(name));
