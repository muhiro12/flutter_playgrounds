// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Override on main
final Provider<SharedPreferences> sharedPreferencesProvider =
    Provider<SharedPreferences>((_) => throw UnimplementedError());

enum SharedPreferencesKey {
  colorCode,
}

extension SharedPreferenecesKeyExtension on SharedPreferencesKey {
  String get value {
    switch (this) {
      case SharedPreferencesKey.colorCode:
        return '80e47ab8';
    }
  }
}
