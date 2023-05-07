import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_playgrounds/foundation/playgrounds_logger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';
import 'feature/git/service/fake_git_hub_repository.dart';
import 'feature/git/service/git_hub.dart';
import 'feature/sample_product/service/fake_sample_product_repository.dart';
import 'feature/sample_product/service/sample_product_repository.dart';
import 'foundation/api_client.dart';
import 'foundation/fake_api_client.dart';
import 'common/preferences.dart';

Future<void> main() async {
  PlaygroundsLogger.instance.record();
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
      logger.shout(error.toString());
    },
  );
}
