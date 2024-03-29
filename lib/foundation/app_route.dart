import 'package:flutter/material.dart';

import '../feature/catalog/page/button_catalog_page.dart';
import '../feature/catalog/page/catalog_page.dart';
import '../feature/format/page/format_page.dart';
import '../feature/home/page/home_page.dart';
import '../feature/markdown/page/markdown_page.dart';
import '../feature/message/page/message_page.dart';
import '../feature/sample_product/page/prefix_sample_product_list_page.dart';
import '../feature/sample_product/page/sample_product_list_page.dart';
import '../feature/sample_product/page/sample_product_page.dart';
import '../feature/scroll/page/default_scroll_page.dart';
import '../feature/settings/page/settings_page.dart';
import '../feature/tab/page/default_tab_page.dart';
import '../feature/tab/page/list_tab_page.dart';
import '../feature/theme/page/design_system_page.dart';
import '../feature/theme/page/platform_page.dart';
import '../feature/theme/page/primary_color_page.dart';
import '../feature/theme/page/theme_flavor_page.dart';
import '../feature/theme/page/theme_mode_page.dart';

enum AppRoute {
  home,
  settings,
  defaultTab,
  listTab,
  themeMode,
  primaryColor,
  catalog,
  buttonCatalog,
  designSystem,
  themeFlavor,
  platform,
  markdown,
  sampleProduct,
  sampleProductList,
  prefixSampleProductList,
  message,
  format,
  defaultScroll,
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
      case AppRoute.sampleProduct:
        return 'sample_item_detail';
      case AppRoute.sampleProductList:
        return '/sample_item_list';
      case AppRoute.prefixSampleProductList:
        return '/prefix_sample_item_list';
      case AppRoute.message:
        return '/message';
      case AppRoute.format:
        return '/format';
      case AppRoute.defaultScroll:
        return '/default_scroll';
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
      case AppRoute.sampleProduct:
        return const SampleProductPage();
      case AppRoute.sampleProductList:
        return const SampleProductListPage();
      case AppRoute.prefixSampleProductList:
        return const PrefixSampleProductListPage();
      case AppRoute.message:
        return const MessagePage();
      case AppRoute.format:
        return const FormatPage();
      case AppRoute.defaultScroll:
        return const DefaultScrollPage();
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
      case AppRoute.sampleProduct:
        return Icons.details;
      case AppRoute.sampleProductList:
        return Icons.list;
      case AppRoute.prefixSampleProductList:
        return Icons.abc;
      case AppRoute.message:
        return Icons.message;
      case AppRoute.format:
        return Icons.text_format;
      case AppRoute.defaultScroll:
        return Icons.line_weight;
    }
  }
}
