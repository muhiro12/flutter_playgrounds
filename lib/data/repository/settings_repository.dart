import 'package:flutter_playgrounds/data/model/preferences.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final Provider<SettingsRepository> settingsRepositoryProvider =
    Provider<SettingsRepository>((ProviderRef<SettingsRepository> ref) {
  final Preferences preferences = ref.watch(preferencesProvider);
  return SettingsRepository(preferences);
});

class SettingsRepository {
  const SettingsRepository(this._preferences);

  final Preferences _preferences;

  int? colorCode() {
    return _preferences.getInt(PreferencesKey.colorCode);
  }

  Future<bool> setColorCode(int colorCode) {
    return _preferences.setInt(PreferencesKey.colorCode, colorCode);
  }
}
