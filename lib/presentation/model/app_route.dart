// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:flutter_playgrounds/presentation/page/default_tab_page.dart';
import 'package:flutter_playgrounds/presentation/page/home_page.dart';
import 'package:flutter_playgrounds/presentation/page/list_tab_page.dart';
import 'package:flutter_playgrounds/presentation/page/long_list_page.dart';
import 'package:flutter_playgrounds/presentation/page/settings_page.dart';

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
