// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:flutter_playgrounds/data/entity/gitignore.dart';
import 'package:flutter_playgrounds/data/repository/git_hub_repository.dart';

final FutureProvider<List<String>> allGitignoreNamesProvider =
    FutureProvider<List<String>>((ProviderRef<AsyncValue<List<String>>> ref) =>
        ref.watch(gitHubRepositoryProvider).allGitignoreNames());

final FutureProviderFamily<Gitignore, String> gitignoreProvider =
    FutureProvider.family(
        (ProviderRef<AsyncValue<Gitignore>> ref, String name) =>
            ref.watch(gitHubRepositoryProvider).gitignore(name));
