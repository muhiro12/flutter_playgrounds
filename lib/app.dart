import 'package:flutter/material.dart';
import 'package:flutter_playgrounds/business/model/primary.dart';
import 'package:flutter_playgrounds/presentation/model/app_route_settings.dart';
import 'package:flutter_playgrounds/presentation/model/primary_color.dart';
import 'package:flutter_playgrounds/presentation/widget/app_home.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Primary primary = ref.watch(primaryProvider);
    return MaterialApp(
      title: 'Flutter Playgrounds',
      themeMode: primary.themeMode,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: primary.color.value,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: primary.color.value,
      ),
      home: const AppHome(),
      onGenerateRoute: (RouteSettings settings) =>
          AppRouteSettings(settings).routeSettings(),
    );
  }
}
