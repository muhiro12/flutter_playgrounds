import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';
import 'business/model/git_hub.dart';
import 'data/model/api_client.dart';
import 'data/model/fake/fake_api_client.dart';
import 'data/model/preferences.dart';
import 'data/repository/fake/fake_git_hub_repository.dart';
import 'data/repository/fake/fake_sample_product_repository.dart';
import 'data/repository/sample_product_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  runZonedGuarded(
    () => runApp(
      ProviderScope(
        overrides: <Override>[
          preferencesProvider.overrideWith(
            (_) => Preferences(sharedPreferences),
          ),
          gitignoreProvider.overrideWith(
            (_, String name) => FakeGitHubRepository().gitignore(name),
          ),
          sampleProductRepositoryProvider.overrideWith(
            (ref) => FakeSampleProductRepository(ref),
          ),
          apiClientProvider.overrideWith(
            (_) => FakeAPIClient(),
          ),
        ],
        child: const App(),
      ),
    ),
    (error, stack) {
      log(error.toString());
    },
  );
}
