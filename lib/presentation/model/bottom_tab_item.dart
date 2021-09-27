import 'package:flutter/material.dart';
import 'package:flutter_playgrounds/presentation/model/app_route.dart';

enum BottomTabItem {
  home,
  gitHub,
  catalog,
  settings,
}

extension BottomTabItemExtension on BottomTabItem {
  AppRoute get _route {
    switch (this) {
      case BottomTabItem.home:
        return AppRoute.home;
      case BottomTabItem.gitHub:
        return AppRoute.gitignoreNames;
      case BottomTabItem.catalog:
        return AppRoute.catalog;
      case BottomTabItem.settings:
        return AppRoute.settings;
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

  Widget get page => _route.page;

  IconData get icon => _route.icon;
}
