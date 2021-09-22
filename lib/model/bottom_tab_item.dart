import 'package:flutter/material.dart';
import 'package:flutter_playgrounds/pages/home_page.dart';
import 'package:flutter_playgrounds/pages/settings_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final bottomTabProvider = StateProvider((_) => BottomTabItem.home);

enum BottomTabItem {
  home,
  settings,
}

extension BottomTabItemExtension on BottomTabItem {
  IconData get icon {
    switch (this) {
      case BottomTabItem.home:
        return Icons.home;
      case BottomTabItem.settings:
        return Icons.settings;
    }
  }

  String get label {
    switch (this) {
      case BottomTabItem.home:
        return 'Home';
      case BottomTabItem.settings:
        return 'Settings';
    }
  }

  Widget get widget {
    switch (this) {
      case BottomTabItem.home:
        return HomePage();
      case BottomTabItem.settings:
        return SettingsPage();
    }
  }
}
