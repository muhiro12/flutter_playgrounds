import 'package:flutter/material.dart';
import 'package:flutter_playgrounds/presentation/page/default_tab_page.dart';
import 'package:flutter_playgrounds/presentation/page/gitignore_names_page.dart';
import 'package:flutter_playgrounds/presentation/page/gitignore_page.dart';
import 'package:flutter_playgrounds/presentation/page/home_page.dart';
import 'package:flutter_playgrounds/presentation/page/list_tab_page.dart';
import 'package:flutter_playgrounds/presentation/page/primary_color_page.dart';
import 'package:flutter_playgrounds/presentation/page/settings_page.dart';
import 'package:flutter_playgrounds/presentation/page/theme_mode_page.dart';

enum AppRoute {
  home,
  settings,
  defaultTab,
  listTab,
  gitignoreNames,
  gitignore,
  themeMode,
  primaryColor,
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
      case AppRoute.themeMode:
        return '/theme_mode';
      case AppRoute.primaryColor:
        return '/primary_color';
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
      case AppRoute.themeMode:
        return const ThemeModePage();
      case AppRoute.primaryColor:
        return const PrimaryColorPage();
    }
  }
}
