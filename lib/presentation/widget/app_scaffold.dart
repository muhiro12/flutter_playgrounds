import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../business/model/primary.dart';
import '../model/design_system.dart';
import 'platform_scaffold.dart';

class AppScaffold extends ConsumerWidget {
  const AppScaffold({
    Key? key,
    required this.title,
    required this.body,
    this.trailing,
  }) : super(key: key);

  final Text title;
  final Widget body;
  final Widget? trailing;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final DesignSystem designSystem = ref.watch(
      primaryProvider.select((Primary primary) => primary.designSystem),
    );
    switch (designSystem) {
      case DesignSystem.dynamic:
        return Scaffold(
          appBar: AppBar(
            title: title,
            actions: <Widget?>[
              trailing,
            ].whereType<Widget>().toList(),
          ),
          body: SafeArea(
            child: body,
          ),
        );
      case DesignSystem.material:
      case DesignSystem.cupertino:
        return PlatformScaffold(
          title: title,
          body: body,
          trailing: trailing,
        );
    }
  }
}
