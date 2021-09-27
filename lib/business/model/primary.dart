// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:flutter_playgrounds/data/repository/settings_repository.dart';
import 'package:flutter_playgrounds/presentation/model/primary_color.dart';

final StateNotifierProvider<PrimaryNotifier, Primary> primaryProvider =
    StateNotifierProvider<PrimaryNotifier, Primary>(
        (StateNotifierProviderRef<PrimaryNotifier, Primary> ref) {
  final SettingsRepository? repository = ref.watch(settingsRepositoryProvider);
  final Primary primary = Primary.values.firstWhere(
    (Primary primary) => primary.color.value == repository?.colorCode(),
    orElse: () => Primary.blue,
  );
  return PrimaryNotifier(primary, repository);
});

class PrimaryNotifier extends StateNotifier<Primary> {
  PrimaryNotifier(Primary state, this._repository) : super(state);

  final SettingsRepository? _repository;

  void select(Primary primary) {
    _repository?.setColorCode(primary.color.value).then((bool value) {
      if (value) {
        state = primary;
      }
    });
  }
}
