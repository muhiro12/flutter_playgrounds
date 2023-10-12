import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../feature/theme/service/primary.dart';
import '../feature/theme/service/primary_color.dart';
import '../feature/theme/service/theme_flavor.dart';

final Provider<AppThemeData> appThemeDataProvider =
    Provider<AppThemeData>((ProviderRef<AppThemeData> ref) {
  final primary = ref.watch(primaryProvider);
  return AppThemeData(primary);
});

class AppThemeData {
  AppThemeData(this._primary);

  final Primary _primary;
  MaterialColor get _materialColor => _primary.color.material;
  CupertinoDynamicColor get _cupertinoColor => _primary.color.cupertino;

  ThemeData get light {
    switch (_primary.themeFlavor) {
      case ThemeFlavor.none:
        return _light;
      case ThemeFlavor.aLittle:
        return _lightALittle;
      case ThemeFlavor.strong:
        return _lightStrong;
    }
  }

  ThemeData get dark {
    switch (_primary.themeFlavor) {
      case ThemeFlavor.none:
        return _dark;
      case ThemeFlavor.aLittle:
        return _darkALittle;
      case ThemeFlavor.strong:
        return _darkStrong;
    }
  }

  ThemeData get _light => ThemeData(
        brightness: Brightness.light,
        primarySwatch: _materialColor,
      );

  ThemeData get _dark => ThemeData(
        brightness: Brightness.dark,
        primarySwatch: _materialColor,
      );

  ThemeData get _lightALittle {
    final original = _light;
    return original.copyWith(
      scaffoldBackgroundColor: Colors.grey.shade200,
      canvasColor: Colors.transparent,
      textTheme: original.textTheme.apply(
        bodyColor: Colors.grey.shade800,
      ),
      cupertinoOverrideTheme: _cupertinoTheme,
    );
  }

  ThemeData get _darkALittle {
    final original = _dark;
    return original.copyWith(
      primaryColor: _materialColor,
      scaffoldBackgroundColor: Colors.grey.shade900,
      dialogBackgroundColor: Colors.grey.shade900,
      canvasColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        color: _materialColor.shade900,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: _materialColor,
      ),
      textTheme: original.textTheme.apply(),
      cupertinoOverrideTheme: _cupertinoTheme,
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return _materialColor;
          }
          return null;
        }),
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return _materialColor;
          }
          return null;
        }),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return _materialColor;
          }
          return null;
        }),
        trackColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return _materialColor;
          }
          return null;
        }),
      ),
    );
  }

  ThemeData get _lightStrong {
    final original = _lightALittle;
    return original.copyWith(
      appBarTheme: original.appBarTheme.copyWith(
        foregroundColor: _materialColor.shade900,
        backgroundColor: Colors.transparent,
        toolbarHeight: 80,
        elevation: 0,
        centerTitle: false,
      ),
    );
  }

  ThemeData get _darkStrong {
    final original = _darkALittle;
    return original.copyWith(
      appBarTheme: original.appBarTheme.copyWith(
        foregroundColor: _materialColor.shade900,
        backgroundColor: Colors.transparent,
        toolbarHeight: 80,
        elevation: 0,
        centerTitle: false,
      ),
    );
  }

  CupertinoThemeData get _cupertinoTheme => CupertinoThemeData(
        primaryColor: _cupertinoColor,
        scaffoldBackgroundColor: CupertinoColors.systemGroupedBackground,
        barBackgroundColor: Colors.transparent,
        textTheme: CupertinoTextThemeData(
          primaryColor: _cupertinoColor,
        ),
      );
}
