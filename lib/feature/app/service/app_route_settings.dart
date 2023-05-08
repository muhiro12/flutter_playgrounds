import 'package:flutter/material.dart';
import '../../../foundation/app_route.dart';

class AppRouteSettings {
  AppRouteSettings(this._settings);

  final RouteSettings _settings;

  PageRoute<dynamic> routeSettings() {
    final route = AppRoute.values
        .firstWhere((AppRoute route) => route.name == _settings.name);
    return MaterialPageRoute<dynamic>(builder: (_) => route.page);
  }
}
