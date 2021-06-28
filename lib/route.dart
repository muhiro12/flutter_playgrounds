import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playgrounds/page/default_tab_page.dart';
import 'package:flutter_playgrounds/page/home_page.dart';
import 'package:flutter_playgrounds/page/list_tab_page.dart';
import 'package:flutter_playgrounds/page/settings_page.dart';

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

enum AppRoute {
  home,
  settings,
  defaultTab,
  listTab,
}

extension AppRouteExtension on AppRoute {
  String get name {
    switch (this) {
      case AppRoute.home:
        return '/';
      case AppRoute.settings:
        return '/settings';
      case AppRoute.defaultTab:
        return '/default_tab';
      case AppRoute.listTab:
        return '/list_tab';
    }
  }

  Widget get page {
    switch (this) {
      case AppRoute.home:
        return HomePage();
      case AppRoute.settings:
        return SettingsPage();
      case AppRoute.defaultTab:
        return DefaultTabPage();
      case AppRoute.listTab:
        return ListTabPage();
    }
  }
}
