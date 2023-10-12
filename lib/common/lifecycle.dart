import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../foundation/app_logger.dart';

final lifecycleProvider = Provider(
  (ref) {
    final observer = _AppLifecycleObserver(
      (value) => ref.state = value,
    );

    WidgetsBinding.instance.addObserver(observer);
    ref.onDispose(() => WidgetsBinding.instance.removeObserver(observer));

    return AppLifecycleState.resumed;
  },
);

class _AppLifecycleObserver extends WidgetsBindingObserver {
  _AppLifecycleObserver(this.onChanged);

  ValueChanged<AppLifecycleState> onChanged;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    logger.info(
        '_AppLifecycleObserver didChangeAppLifecycleState is called $state');
    onChanged(state);
    super.didChangeAppLifecycleState(state);
  }
}
