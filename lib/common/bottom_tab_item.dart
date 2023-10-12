import 'package:flutter/material.dart';

import '../foundation/app_route.dart';

enum BottomTabItem {
  recent,
  catalog,
  home,
  settings,
}

extension BottomTabItemExtension on BottomTabItem {
  AppRoute get _route {
    switch (this) {
      case BottomTabItem.recent:
        return AppRoute.values.last;
      case BottomTabItem.catalog:
        return AppRoute.catalog;
      case BottomTabItem.home:
        return AppRoute.home;
      case BottomTabItem.settings:
        return AppRoute.settings;
    }
  }

  String get label {
    switch (this) {
      case BottomTabItem.recent:
        return 'Recent';
      case BottomTabItem.catalog:
        return 'Catalog';
      case BottomTabItem.home:
        return 'Home';
      case BottomTabItem.settings:
        return 'Settings';
    }
  }

  Widget get page => _route.page;

  IconData get icon => _route.icon;
}
