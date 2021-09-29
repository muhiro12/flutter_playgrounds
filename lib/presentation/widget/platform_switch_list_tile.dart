import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playgrounds/business/model/primary.dart';
import 'package:flutter_playgrounds/presentation/model/design_platform.dart';
import 'package:flutter_playgrounds/presentation/model/design_platform_settings.dart';
import 'package:flutter_playgrounds/presentation/widget/platform_switch.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
    final DesignPlatformSettings designPlatformSettings = ref.watch(
      primaryProvider
          .select((Primary primary) => primary.designPlatformSettings),
    );
    switch (designPlatformSettings.platform(context)) {
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
