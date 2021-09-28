import 'package:flutter/material.dart';
import 'package:flutter_playgrounds/data/repository/primary_repository.dart';
import 'package:flutter_playgrounds/presentation/model/design_settings.dart';
import 'package:flutter_playgrounds/presentation/model/primary_color.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final ChangeNotifierProvider<Primary> primaryProvider =
    ChangeNotifierProvider<Primary>((ChangeNotifierProviderRef<Primary> ref) {
  final PrimaryRepository repository = ref.watch(primaryRepositoryProvider);
  return Primary(repository);
});

class Primary extends ChangeNotifier {
  Primary(this._repository);

  final PrimaryRepository _repository;

  ThemeMode get themeMode => _repository.themeMode();
  PrimaryColor get color => _repository.primaryColor();
  bool get useCustomTheme => _repository.useCustomTheme();
  DesignSettings get designSettings => _repository.designSettings();

  void selectThemeMode(ThemeMode themeMode) =>
      _repository.setThemeMode(themeMode);
  void selectPrimaryColor(PrimaryColor primaryColor) =>
      _repository.setPrimaryColor(primaryColor);
  void selectUseCustomTheme(bool useCustomTheme) =>
      _repository.setUseCustomTheme(useCustomTheme);
  void selectDesignSettings(DesignSettings designSettings) =>
      _repository.setDesignSettings(designSettings);
}
