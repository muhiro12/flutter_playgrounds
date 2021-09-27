import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformSwitch extends StatelessWidget {
  const PlatformSwitch({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final bool value;
  final ValueChanged<bool>? onChanged;

  @override
  Widget build(BuildContext context) {
    final TargetPlatform platform = Theme.of(context).platform;
    switch (platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return Switch(
          value: value,
          onChanged: onChanged,
        );
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return CupertinoSwitch(
          value: value,
          onChanged: onChanged,
          activeColor: Theme.of(context).primaryColor,
        );
    }
  }
}
