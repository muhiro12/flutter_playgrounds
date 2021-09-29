import 'package:flutter/material.dart';
import 'package:flutter_playgrounds/presentation/page/button_catalog_page.dart';
import 'package:flutter_playgrounds/presentation/page/catalog_page.dart';
import 'package:flutter_playgrounds/presentation/page/default_tab_page.dart';
import 'package:flutter_playgrounds/presentation/page/design_platform_settings_page.dart';
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
  catalog,
  buttonCatalog,
  designPlatformSettings,
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
      case AppRoute.catalog:
        return '/catalog';
      case AppRoute.buttonCatalog:
        return '/button_catalog';
      case AppRoute.designPlatformSettings:
        return '/design_platform_settings';
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
      case AppRoute.catalog:
        return const CatalogPage();
      case AppRoute.buttonCatalog:
        return const ButtonCatalogPage();
      case AppRoute.designPlatformSettings:
        return const DesignPlatformSettingsPage();
    }
  }

  IconData get icon {
    switch (this) {
      case AppRoute.home:
        return Icons.home;
      case AppRoute.settings:
        return Icons.settings;
      case AppRoute.defaultTab:
        return Icons.table_chart;
      case AppRoute.listTab:
        return Icons.view_list;
      case AppRoute.gitignoreNames:
        return Icons.code;
      case AppRoute.gitignore:
        return Icons.code_off;
      case AppRoute.themeMode:
        return Icons.invert_colors;
      case AppRoute.primaryColor:
        return Icons.color_lens;
      case AppRoute.catalog:
        return Icons.view_module;
      case AppRoute.buttonCatalog:
        return Icons.add;
      case AppRoute.designPlatformSettings:
        return Icons.design_services;
    }
  }
}
