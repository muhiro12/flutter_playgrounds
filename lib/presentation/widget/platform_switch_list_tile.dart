import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../business/model/primary.dart';
import '../model/design_platform.dart';
import '../model/design_system.dart';
import 'platform_switch.dart';

class PlatformSwitchListTile extends ConsumerWidget {
  const PlatformSwitchListTile({
    Key? key,
    required this.value,
    required this.onChanged,
    this.title,
  }) : super(key: key);

  final bool value;
  final ValueChanged<bool>? onChanged;
  final Widget? title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final designSystem = ref.watch(
      primaryProvider.select((Primary primary) => primary.designSystem),
    );
    switch (designSystem.platform(context)) {
      case DesignPlatform.material:
        return SwitchListTile(
          value: value,
          onChanged: onChanged,
          title: title,
        );
      case DesignPlatform.cupertino:
        return ListTile(
          trailing: PlatformSwitch(
            value: value,
            onChanged: onChanged,
          ),
          title: title,
        );
    }
  }
}
