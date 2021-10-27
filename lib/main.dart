import 'package:flutter/material.dart';
import 'package:flutter_playgrounds/app.dart';
import 'package:flutter_playgrounds/business/model/git_hub.dart';
import 'package:flutter_playgrounds/data/entity/gitignore.dart';
import 'package:flutter_playgrounds/data/model/preferences.dart';
import 'package:flutter_playgrounds/data/repository/fake/fake_git_hub_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  runApp(
    ProviderScope(
      overrides: <Override>[
        preferencesProvider.overrideWithValue(
          Preferences(sharedPreferences),
        ),
        // TODO(nakano): Not working yet
        gitignoreProvider('').overrideWithValue(
          AsyncValue<Gitignore>.data(
            await FakeGitHubRepository().gitignore(''),
          ),
        ),
      ],
      child: const App(),
    ),
  );
}
