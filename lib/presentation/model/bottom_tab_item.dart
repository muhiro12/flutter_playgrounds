import 'package:flutter/material.dart';
import 'package:flutter_playgrounds/presentation/model/app_route.dart';

enum BottomTabItem {
  home,
  gitHub,
  catalog,
  settings,
}

extension BottomTabItemExtension on BottomTabItem {
  IconData get icon {
    switch (this) {
      case BottomTabItem.home:
        return Icons.home;
      case BottomTabItem.gitHub:
        return Icons.code;
      case BottomTabItem.catalog:
        return Icons.view_module;
      case BottomTabItem.settings:
        return Icons.settings;
    }
  }

  String get label {
    switch (this) {
      case BottomTabItem.home:
        return 'Home';
      case BottomTabItem.gitHub:
        return 'GitHub';
      case BottomTabItem.catalog:
        return 'Catalog';
      case BottomTabItem.settings:
        return 'Settings';
    }
  }

  Widget get page {
    switch (this) {
      case BottomTabItem.home:
        return AppRoute.home.page;
      case BottomTabItem.gitHub:
        return AppRoute.gitignoreNames.page;
      case BottomTabItem.catalog:
        return AppRoute.catalog.page;
      case BottomTabItem.settings:
        return AppRoute.settings.page;
    }
  }
}
