import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/preferences.dart';
import '../../../common/preferences_key.dart';
import 'design_system.dart';
import 'primary_color.dart';
import 'theme_flavor.dart';

final Provider<PrimaryRepository> primaryRepositoryProvider =
    Provider<PrimaryRepository>((ProviderRef<PrimaryRepository> ref) {
  final preferences = ref.watch(preferencesProvider);
  return PrimaryRepository(preferences);
});

class PrimaryRepository {
  const PrimaryRepository(this._preferences);

  final Preferences _preferences;

  ThemeMode themeMode() {
    final index = _preferences.getInt(PreferencesKey.themeModeIndex);
    return ThemeMode.values[index ?? 0];
  }

  PrimaryColor primaryColor() {
    final index = _preferences.getInt(PreferencesKey.primaryColorIndex);
    return PrimaryColor.values[index ?? 0];
  }

  ThemeFlavor themeFlavor() {
    final index = _preferences.getInt(PreferencesKey.themeFlavorIndex);
    return ThemeFlavor.values[index ?? 1];
  }

  DesignSystem designSystem() {
    final index = _preferences.getInt(PreferencesKey.designSystemIndex);
    return DesignSystem.values[index ?? 0];
  }

  Future<bool> setThemeMode(ThemeMode themeMode) {
    return _preferences.setInt(
      PreferencesKey.themeModeIndex,
      themeMode.index,
    );
  }

  Future<bool> setPrimaryColor(PrimaryColor primaryColor) {
    return _preferences.setInt(
      PreferencesKey.primaryColorIndex,
      primaryColor.index,
    );
  }

  Future<bool> setThemeFlavor(ThemeFlavor themeFlavor) {
    return _preferences.setInt(
      PreferencesKey.themeFlavorIndex,
      themeFlavor.index,
    );
  }

  Future<bool> setDesignSystem(DesignSystem designSystem) {
    return _preferences.setInt(
      PreferencesKey.designSystemIndex,
      designSystem.index,
    );
  }
}
