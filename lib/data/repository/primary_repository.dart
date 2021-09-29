import 'package:flutter/material.dart';
import 'package:flutter_playgrounds/data/model/preferences.dart';
import 'package:flutter_playgrounds/data/model/preferences_key.dart';
import 'package:flutter_playgrounds/presentation/model/design_platform_settings.dart';
import 'package:flutter_playgrounds/presentation/model/primary_color.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final Provider<PrimaryRepository> primaryRepositoryProvider =
    Provider<PrimaryRepository>((ProviderRef<PrimaryRepository> ref) {
  final Preferences preferences = ref.watch(preferencesProvider);
  return PrimaryRepository(preferences);
});

class PrimaryRepository {
  const PrimaryRepository(this._preferences);

  final Preferences _preferences;

  ThemeMode themeMode() {
    final int? index = _preferences.getInt(PreferencesKey.themeModeIndex);
    return ThemeMode.values[index ?? 0];
  }

  PrimaryColor primaryColor() {
    final int? colorCode = _preferences.getInt(PreferencesKey.colorCode);
    return PrimaryColor.values.firstWhere(
      (PrimaryColor primaryColor) => primaryColor.value.value == colorCode,
      orElse: () => PrimaryColor.blue,
    );
  }

  bool useCustomTheme() {
    return _preferences.getBool(PreferencesKey.useCustomTheme) ?? false;
  }

  DesignPlatformSettings designPlatformSettings() {
    final int? index =
        _preferences.getInt(PreferencesKey.designPlatformSettingsIndex);
    return DesignPlatformSettings.values[index ?? 0];
  }

  Future<bool> setThemeMode(ThemeMode themeMode) {
    return _preferences.setInt(
      PreferencesKey.themeModeIndex,
      themeMode.index,
    );
  }

  Future<bool> setPrimaryColor(PrimaryColor primaryColor) {
    return _preferences.setInt(
      PreferencesKey.colorCode,
      primaryColor.value.value,
    );
  }

  Future<bool> setUseCustomTheme(bool useCustomTheme) {
    return _preferences.setBool(
      PreferencesKey.useCustomTheme,
      useCustomTheme,
    );
  }

  Future<bool> setDesignPlatformSettings(
      DesignPlatformSettings designPlatformSettings) {
    return _preferences.setInt(
      PreferencesKey.designPlatformSettingsIndex,
      designPlatformSettings.index,
    );
  }
}
