// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:flutter_playgrounds/data/entity/gitignore.dart';
import 'package:flutter_playgrounds/data/repository/git_hub_repository.dart';

final FutureProvider<List<Gitignore>> gitignoreTemplatesProvider =
    FutureProvider<List<Gitignore>>(
        (ProviderRef<AsyncValue<List<Gitignore>>> ref) =>
            ref.watch(gitHubRepositoryProvider).gitignoreTemplates());
