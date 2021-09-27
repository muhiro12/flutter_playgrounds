import 'package:flutter_playgrounds/data/model/shared_preferences.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final Provider<SettingsRepository> settingsRepositoryProvider =
    Provider<SettingsRepository>((ProviderRef<SettingsRepository> ref) {
  final SharedPreferences sharedPreferences =
      ref.watch(sharedPreferencesProvider);
  return SettingsRepository(sharedPreferences);
});

class SettingsRepository {
  const SettingsRepository(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;

  int? colorCode() {
    return _sharedPreferences.getInt(SharedPreferencesKey.colorCode.value);
  }

  Future<bool> setColorCode(int colorCode) {
    return _sharedPreferences.setInt(
      SharedPreferencesKey.colorCode.value,
      colorCode,
    );
  }
}
