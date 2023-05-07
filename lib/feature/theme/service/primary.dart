import 'package:flutter/material.dart';
import 'package:flutter_playgrounds/feature/theme/service/design_system.dart';
import 'package:flutter_playgrounds/feature/theme/service/primary_color.dart';
import 'package:flutter_playgrounds/feature/theme/service/primary_repository.dart';
import 'package:flutter_playgrounds/feature/theme/service/theme_flavor.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final ChangeNotifierProvider<Primary> primaryProvider =
    ChangeNotifierProvider<Primary>((ChangeNotifierProviderRef<Primary> ref) {
  final repository = ref.watch(primaryRepositoryProvider);
  return Primary(repository);
});

class Primary extends ChangeNotifier {
  Primary(this._repository);

  final PrimaryRepository _repository;

  ThemeMode get themeMode => _repository.themeMode();
  PrimaryColor get color => _repository.primaryColor();
  ThemeFlavor get themeFlavor => _repository.themeFlavor();
  DesignSystem get designSystem => _repository.designSystem();

  void selectThemeMode(ThemeMode themeMode) =>
      _repository.setThemeMode(themeMode);
  void selectPrimaryColor(PrimaryColor primaryColor) =>
      _repository.setPrimaryColor(primaryColor);
  void selectThemeFlavor(ThemeFlavor themeFlavor) =>
      _repository.setThemeFlavor(themeFlavor);
  void selectDesignSystem(DesignSystem designSystem) =>
      _repository.setDesignSystem(designSystem);
}
