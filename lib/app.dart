import 'package:flutter/material.dart';
import 'package:flutter_playgrounds/feature/app/service/app_route_settings.dart';
import 'package:flutter_playgrounds/feature/app/widget/app_home.dart';
import 'package:flutter_playgrounds/feature/theme/service/primary.dart';
import 'package:flutter_playgrounds/common/app_theme_data.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
