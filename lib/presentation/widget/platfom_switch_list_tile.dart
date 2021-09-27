import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playgrounds/presentation/widget/platform_switch.dart';

class PlatformSwitchListTile extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final TargetPlatform platform = Theme.of(context).platform;
    switch (platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return SwitchListTile(
          value: value,
          onChanged: onChanged,
          title: title,
        );
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
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
