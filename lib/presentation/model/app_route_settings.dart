import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playgrounds/presentation/model/app_route.dart';

class AppRouteSettings {
  AppRouteSettings(this._settings);

  RouteSettings _settings;

  PageRoute routeSettings() {
    final route = AppRoute.values.firstWhere((element) {
      if (element.name == _settings.name) {
        return true;
      }
      return false;
    });
    return CupertinoPageRoute(builder: (_) => route.page);
  }
}
