import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playgrounds/pages/default_tab_page.dart';
import 'package:flutter_playgrounds/pages/home_page.dart';
import 'package:flutter_playgrounds/pages/list_tab_page.dart';
import 'package:flutter_playgrounds/pages/long_list_page.dart';
import 'package:flutter_playgrounds/pages/settings_page.dart';

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
  longList,
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
      case AppRoute.longList:
        return '/long_list';
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
      case AppRoute.longList:
        return LongListPage();
    }
  }
}
