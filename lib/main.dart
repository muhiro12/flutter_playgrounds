// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:flutter_playgrounds/presentation/model/app_route_settings.dart';
import 'package:flutter_playgrounds/presentation/model/bottom_tab.dart';
import 'package:flutter_playgrounds/presentation/model/bottom_tab_item.dart';
import 'package:flutter_playgrounds/presentation/widget/bottom_tab.dart';

void main() {
  runApp(
    ProviderScope(
      child: App(),
    ),
  );
}

class App extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomTab = ref.watch(bottomTabProvider);
    return MaterialApp(
      title: 'Playground Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: bottomTab.state.widget,
        bottomNavigationBar: BottomTab(),
      ),
      onGenerateRoute: (settings) => AppRouteSettings(settings).routeSettings(),
    );
  }
}
