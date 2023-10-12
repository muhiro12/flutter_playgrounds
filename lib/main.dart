import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_playgrounds/common/preferences.dart';
import 'package:flutter_playgrounds/feature/sample_product/service/mock/sample_product_repository_mock.dart';
import 'package:flutter_playgrounds/feature/sample_product/service/sample_product_repository.dart';
import 'package:flutter_playgrounds/foundation/api_client.dart';
import 'package:flutter_playgrounds/foundation/app_home.dart';
import 'package:flutter_playgrounds/foundation/app_logger.dart';
import 'package:flutter_playgrounds/foundation/app_route_settings.dart';
import 'package:flutter_playgrounds/foundation/mock/api_client_mock.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
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
          sampleProductRepositoryProvider.overrideWith(
            (ref) => SampleProductRepositoryMock(ref),
          ),
          apiClientProvider.overrideWith(
            (_) => APIClientMock(),
          ),
        ],
        child: const MyApp(),
      ),
    ),
    (error, stack) {
      logger.shout(error.toString());
    },
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter Playgrounds',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AppHome(),
      onGenerateRoute: (RouteSettings settings) =>
          AppRouteSettings(settings).routeSettings(),
    );
  }
}
