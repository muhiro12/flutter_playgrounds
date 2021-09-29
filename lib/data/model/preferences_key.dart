enum PreferencesKey {
  colorCode,
  themeModeIndex,
  useCustomTheme,
  designPlatformSettingsIndex,
  designSystemIndex,
}

extension PreferenecesKeyExtension on PreferencesKey {
  String get value {
    switch (this) {
      case PreferencesKey.colorCode:
        return '80e47ab8';
      case PreferencesKey.themeModeIndex:
        return '92dd066a';
      case PreferencesKey.useCustomTheme:
        return 'a3ab8625';
      case PreferencesKey.designPlatformSettingsIndex:
        return '2fe46221';
      case PreferencesKey.designSystemIndex:
        return '8ba49494';
    }
  }
}
