// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:flutter_playgrounds/presentation/page/default_tab_page.dart';
import 'package:flutter_playgrounds/presentation/page/gitignore_names_page.dart';
import 'package:flutter_playgrounds/presentation/page/gitignore_page.dart';
import 'package:flutter_playgrounds/presentation/page/home_page.dart';
import 'package:flutter_playgrounds/presentation/page/list_tab_page.dart';
import 'package:flutter_playgrounds/presentation/page/settings_page.dart';

enum AppRoute {
  home,
  settings,
  defaultTab,
  listTab,
  gitignoreNames,
  gitignore,
}

extension AppRouteExtension on AppRoute {
  String get name {
    switch (this) {
      case AppRoute.home:
        return '/home';
      case AppRoute.settings:
        return '/settings';
      case AppRoute.defaultTab:
        return '/default_tab';
      case AppRoute.listTab:
        return '/list_tab';
      case AppRoute.gitignoreNames:
        return '/gitignore_names';
      case AppRoute.gitignore:
        return '/gitignore';
    }
  }

  Widget get page {
    switch (this) {
      case AppRoute.home:
        return const HomePage();
      case AppRoute.settings:
        return const SettingsPage();
      case AppRoute.defaultTab:
        return const DefaultTabPage();
      case AppRoute.listTab:
        return const ListTabPage();
      case AppRoute.gitignoreNames:
        return const GitignoreNamesPage();
      case AppRoute.gitignore:
        return const GitignorePage();
    }
  }
}
