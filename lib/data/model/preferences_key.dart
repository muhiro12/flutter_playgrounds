enum PreferencesKey {
  colorCode,
  themeModeIndex,
  useCustomTheme,
  designPlatformSettings,
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
      case PreferencesKey.designPlatformSettings:
        return '2fe46221';
    }
  }
}
