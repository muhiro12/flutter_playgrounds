import 'package:flutter/material.dart';
import 'package:flutter_playgrounds/presentation/page/gitignore_names_page.dart';
import 'package:flutter_playgrounds/presentation/page/home_page.dart';
import 'package:flutter_playgrounds/presentation/page/settings_page.dart';

enum BottomTabItem {
  home,
  gitHub,
  settings,
}

extension BottomTabItemExtension on BottomTabItem {
  IconData get icon {
    switch (this) {
      case BottomTabItem.home:
        return Icons.home;
      case BottomTabItem.gitHub:
        return Icons.code;
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
      case BottomTabItem.settings:
        return 'Settings';
    }
  }

  Widget get page {
    switch (this) {
      case BottomTabItem.home:
        return const HomePage();
      case BottomTabItem.gitHub:
        return const GitignoreNamesPage();
      case BottomTabItem.settings:
        return const SettingsPage();
    }
  }
}
