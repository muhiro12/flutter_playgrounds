import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playgrounds/business/model/primary.dart';
import 'package:flutter_playgrounds/presentation/model/design_platform.dart';
import 'package:flutter_playgrounds/presentation/model/design_platform_settings.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PlatformSwitch extends ConsumerWidget {
  const PlatformSwitch({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final bool value;
  final ValueChanged<bool>? onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final DesignPlatformSettings designPlatformSettings = ref.watch(
      primaryProvider
          .select((Primary primary) => primary.designPlatformSettings),
    );
    switch (designPlatformSettings.platform(context)) {
      case DesignPlatform.material:
        return Switch(
          value: value,
          onChanged: onChanged,
        );
      case DesignPlatform.cupertino:
        return CupertinoSwitch(
          value: value,
          onChanged: onChanged,
          activeColor: Theme.of(context).primaryColor,
        );
    }
  }
}
