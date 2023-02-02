import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';
import 'business/model/git_hub.dart';
import 'data/model/preferences.dart';
import 'data/repository/fake/fake_git_hub_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences =
      await SharedPreferences.getInstance();
  runApp(
    ProviderScope(
      overrides: <Override>[
        preferencesProvider.overrideWith(
          (_) => Preferences(sharedPreferences),
        ),
        gitignoreProvider.overrideWith(
          (_, String name) => FakeGitHubRepository().gitignore(name),
        ),
      ],
      child: const App(),
    ),
  );
}
