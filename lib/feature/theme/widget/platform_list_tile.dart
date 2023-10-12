import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../service/design_platform.dart';
import '../service/design_system.dart';
import '../service/primary.dart';

class PlatformListTile extends ConsumerWidget {
  const PlatformListTile({
    Key? key,
    this.title,
    this.subtitle,
    this.onTap,
  }) : super(key: key);

  final Widget? title;
  final Widget? subtitle;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final designSystem = ref.watch(
      primaryProvider.select((Primary primary) => primary.designSystem),
    );

    switch (designSystem.platform(context)) {
      case DesignPlatform.material:
        return ListTile(
          onTap: onTap,
          title: title,
          subtitle: subtitle,
        );
      case DesignPlatform.cupertino:
        return CupertinoButton(
          padding: EdgeInsets.zero,
          minSize: 44,
          onPressed: onTap,
          child: CupertinoFormRow(
            prefix: title,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                if (subtitle != null) subtitle!,
                if (onTap != null) const SizedBox(width: 4),
                if (onTap != null) const Icon(CupertinoIcons.forward),
              ],
            ),
          ),
        );
    }
  }
}
