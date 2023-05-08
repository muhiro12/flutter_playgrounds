import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_playgrounds/foundation/app_logger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';
import 'common/preferences.dart';
import 'feature/git/service/git_hub.dart';
import 'feature/git/service/git_hub_repository_mock.dart';
import 'feature/sample_product/service/sample_product_repository.dart';
import 'feature/sample_product/service/sample_product_repository_mock.dart';
import 'foundation/api_client.dart';
import 'foundation/api_client_mock.dart';

Future<void> main() async {
  AppLogger.instance.record();
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
            (_, String name) => GitHubRepositoryMock().gitignore(name),
          ),
          sampleProductRepositoryProvider.overrideWith(
            (ref) => SampleProductRepositoryMock(ref),
          ),
          apiClientProvider.overrideWith(
            (_) => APIClientMock(),
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
