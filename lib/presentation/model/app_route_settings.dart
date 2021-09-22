// Flutter imports:
import 'package:flutter/cupertino.dart';

// Project imports:
import 'package:flutter_playgrounds/presentation/model/app_route.dart';

class AppRouteSettings {
  AppRouteSettings(this._settings);

  final RouteSettings _settings;

  PageRoute<dynamic> routeSettings() {
    final AppRoute route = AppRoute.values
        .firstWhere((AppRoute route) => route.name == _settings.name);
    return CupertinoPageRoute<dynamic>(builder: (_) => route.page);
  }
}
