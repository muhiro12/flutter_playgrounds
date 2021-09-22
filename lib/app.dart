// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:flutter_playgrounds/presentation/model/app_route_settings.dart';
import 'package:flutter_playgrounds/presentation/widget/app_home.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Playgrounds',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AppHome(),
      onGenerateRoute: (RouteSettings settings) =>
          AppRouteSettings(settings).routeSettings(),
    );
  }
}
