import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playgrounds/business/model/primary.dart';
import 'package:flutter_playgrounds/presentation/model/primary_color.dart';
import 'package:flutter_playgrounds/presentation/model/theme_flavor.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final Provider<AppThemeData> appThemeDataProvider =
    Provider<AppThemeData>((ProviderRef<AppThemeData> ref) {
  final Primary primary = ref.watch(primaryProvider);
  return AppThemeData(primary);
});

class AppThemeData {
  AppThemeData(this._primary);

  final Primary _primary;
  MaterialColor get _primaryColor => _primary.color.value;

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
        primarySwatch: _primaryColor,
      );

  ThemeData get _dark => ThemeData(
        brightness: Brightness.dark,
        primarySwatch: _primaryColor,
      );

  ThemeData get _lightALittle {
    final ThemeData original = _light;
    return original.copyWith(
      scaffoldBackgroundColor: Colors.grey.shade200,
      canvasColor: Colors.transparent,
      dividerColor: _primaryColor.shade200,
      textTheme: original.textTheme.apply(
        bodyColor: Colors.grey.shade800,
      ),
      cupertinoOverrideTheme: CupertinoThemeData(
        primaryColor: _primary.color.cupertino,
        scaffoldBackgroundColor: CupertinoColors.secondarySystemBackground,
        barBackgroundColor: Colors.transparent,
        textTheme: CupertinoTextThemeData(
          primaryColor: _primary.color.cupertino,
        ),
      ),
    );
  }

  ThemeData get _darkALittle {
    final ThemeData original = _dark;
    return original.copyWith(
      primaryColor: _primaryColor,
      scaffoldBackgroundColor: Colors.grey.shade900,
      toggleableActiveColor: _primaryColor,
      dialogBackgroundColor: Colors.grey.shade900,
      canvasColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        color: _primaryColor.shade900,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: _primaryColor,
      ),
      textTheme: original.textTheme.apply(),
      cupertinoOverrideTheme: CupertinoThemeData(
        primaryColor: _primary.color.cupertino,
        scaffoldBackgroundColor: CupertinoColors.secondarySystemBackground,
        barBackgroundColor: Colors.transparent,
        textTheme: CupertinoTextThemeData(
          primaryColor: _primary.color.cupertino,
        ),
      ),
    );
  }

  ThemeData get _lightStrong => _lightALittle.copyWith();

  ThemeData get _darkStrong => _darkALittle.copyWith();
}
