import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'common/app_theme_data.dart';
import 'feature/theme/service/primary.dart';
import 'foundation/app_home.dart';
import 'foundation/app_route_settings.dart';

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter Playgrounds',
      themeMode: ref.watch(
        primaryProvider.select((Primary primary) => primary.themeMode),
      ),
      theme: ref.watch(appThemeDataProvider).light,
      darkTheme: ref.watch(appThemeDataProvider).dark,
      home: const AppHome(),
      onGenerateRoute: (RouteSettings settings) =>
          AppRouteSettings(settings).routeSettings(),
    );
  }
}
