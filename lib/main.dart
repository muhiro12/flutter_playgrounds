// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:flutter_playgrounds/app.dart';
import 'package:flutter_playgrounds/business/model/git_hub.dart';
import 'package:flutter_playgrounds/data/entity/gitignore.dart';
import 'package:flutter_playgrounds/data/repository/fake/fake_git_hub_repository.dart';

void main() {
  runApp(
    ProviderScope(
      overrides: <Override>[
        // TODO(nakano): Not working yet
        gitignoreProvider.overrideWithProvider(
          (String argument) => FutureProvider<Gitignore>(
            (_) async => FakeGitHubRepository().gitignore(argument),
          ),
        ),
      ],
      child: const App(),
    ),
  );
}
