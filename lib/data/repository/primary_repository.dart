import 'package:flutter/material.dart';
import 'package:flutter_playgrounds/data/model/preferences.dart';
import 'package:flutter_playgrounds/data/model/preferences_key.dart';
import 'package:flutter_playgrounds/presentation/model/design_system.dart';
import 'package:flutter_playgrounds/presentation/model/primary_color.dart';
import 'package:flutter_playgrounds/presentation/model/theme_flavor.dart';
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

  ThemeFlavor themeFlavor() {
    final int? index = _preferences.getInt(PreferencesKey.themeFlavorIndex);
    return ThemeFlavor.values[index ?? 1];
  }

  DesignSystem designSystem() {
    final int? index = _preferences.getInt(PreferencesKey.designSystemIndex);
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
      PreferencesKey.colorCode,
      primaryColor.value.value,
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
