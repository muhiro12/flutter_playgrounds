import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Override on main
final ChangeNotifierProvider<Preferences> preferencesProvider =
    ChangeNotifierProvider<Preferences>((_) => throw UnimplementedError());

class Preferences extends ChangeNotifier {
  Preferences(this._instance);

  final SharedPreferences _instance;

  Object? get(PreferencesKey key) => _instance.get(key.value);
  bool? getBool(PreferencesKey key) => _instance.getBool(key.value);
  int? getInt(PreferencesKey key) => _instance.getInt(key.value);
  double? getDouble(PreferencesKey key) => _instance.getDouble(key.value);
  String? getString(PreferencesKey key) => _instance.getString(key.value);

  bool containsKey(PreferencesKey key) => _instance.containsKey(key.value);
  List<String>? getStringList(PreferencesKey key) =>
      _instance.getStringList(key.value);

  Future<bool> setBool(PreferencesKey key, bool value) =>
      _instance.setBool(key.value, value).whenComplete(notifyListeners);
  Future<bool> setInt(PreferencesKey key, int value) =>
      _instance.setInt(key.value, value).whenComplete(notifyListeners);
  Future<bool> setDouble(PreferencesKey key, double value) =>
      _instance.setDouble(key.value, value).whenComplete(notifyListeners);
  Future<bool> setString(PreferencesKey key, String value) =>
      _instance.setString(key.value, value).whenComplete(notifyListeners);
  Future<bool> setStringList(PreferencesKey key, List<String> value) =>
      _instance.setStringList(key.value, value).whenComplete(notifyListeners);

  Future<bool> remove(PreferencesKey key) =>
      _instance.remove(key.value).whenComplete(notifyListeners);
  Future<bool> clear() => _instance.clear().whenComplete(notifyListeners);
}

enum PreferencesKey {
  colorCode,
  themeModeIndex,
  useCustomTheme,
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
    }
  }
}
