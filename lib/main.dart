// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_playgrounds/data/model/shared_preferences.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:flutter_playgrounds/app.dart';
import 'package:flutter_playgrounds/business/model/git_hub.dart';
import 'package:flutter_playgrounds/data/entity/gitignore.dart';
import 'package:flutter_playgrounds/data/repository/fake/fake_git_hub_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  runApp(
    ProviderScope(
      overrides: <Override>[
        sharedPreferencesProvider.overrideWithProvider(
          Provider<SharedPreferences>(
            (_) => sharedPreferences,
          ),
        ),
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
