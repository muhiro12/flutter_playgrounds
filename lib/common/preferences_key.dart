
enum PreferencesKey {
  primaryColorIndex,
  themeModeIndex,
  themeFlavorIndex,
  designSystemIndex,
}

extension PreferenecesKeyExtension on PreferencesKey {
  String get value {
    switch (this) {
      case PreferencesKey.primaryColorIndex:
        return '80e47ab8';
      case PreferencesKey.themeModeIndex:
        return '92dd066a';
      case PreferencesKey.themeFlavorIndex:
        return 'a3ab8625';
      case PreferencesKey.designSystemIndex:
        return '8ba49494';
    }
  }
}
