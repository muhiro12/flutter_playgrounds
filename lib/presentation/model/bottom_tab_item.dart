// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:flutter_playgrounds/presentation/page/home_page.dart';
import 'package:flutter_playgrounds/presentation/page/settings_page.dart';

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
