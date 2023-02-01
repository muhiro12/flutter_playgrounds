import 'package:flutter/material.dart';

import '../page/button_catalog_page.dart';
import '../page/catalog_page.dart';
import '../page/default_tab_page.dart';
import '../page/design_system_page.dart';
import '../page/gitignore_names_page.dart';
import '../page/gitignore_page.dart';
import '../page/home_page.dart';
import '../page/list_tab_page.dart';
import '../page/markdown_page.dart';
import '../page/platform_page.dart';
import '../page/primary_color_page.dart';
import '../page/sample_item_detail_page.dart';
import '../page/sample_item_list_page.dart';
import '../page/settings_page.dart';
import '../page/theme_flavor_page.dart';
import '../page/theme_mode_page.dart';

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
  designSystem,
  themeFlavor,
  platform,
  markdown,
  sampleItemList,
  sampleItemDetail,
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
      case AppRoute.designSystem:
        return '/design_system';
      case AppRoute.themeFlavor:
        return '/theme_flavor';
      case AppRoute.platform:
        return '/platform';
      case AppRoute.markdown:
        return '/markdown';
      case AppRoute.sampleItemList:
        return '/sample_item_list';
      case AppRoute.sampleItemDetail:
        return 'sample_item_detail';
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
      case AppRoute.designSystem:
        return const DesignSystemPage();
      case AppRoute.themeFlavor:
        return const ThemeFlavorPage();
      case AppRoute.platform:
        return const PlatformPage();
      case AppRoute.markdown:
        return const MarkdownPage();
      case AppRoute.sampleItemList:
        return const SampleItemListPage();
      case AppRoute.sampleItemDetail:
        return const SampleItemDetailPage();
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
      case AppRoute.designSystem:
        return Icons.design_services;
      case AppRoute.themeFlavor:
        return Icons.coffee;
      case AppRoute.platform:
        return Icons.phone_android;
      case AppRoute.markdown:
        return Icons.file_copy;
      case AppRoute.sampleItemList:
        return Icons.list;
      case AppRoute.sampleItemDetail:
        return Icons.details;
    }
  }
}
