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
    return MaterialApp(
      title: 'Flutter Playgrounds',
      theme: ThemeData(
        primarySwatch: ref.watch(primaryProvider).color,
      ),
      home: const AppHome(),
      onGenerateRoute: (RouteSettings settings) =>
          AppRouteSettings(settings).routeSettings(),
    );
  }
}
