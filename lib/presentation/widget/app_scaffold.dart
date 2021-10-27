import 'package:flutter/material.dart';
import 'package:flutter_playgrounds/business/model/primary.dart';
import 'package:flutter_playgrounds/presentation/model/design_system.dart';
import 'package:flutter_playgrounds/presentation/widget/platform_scaffold.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppScaffold extends ConsumerWidget {
  const AppScaffold({
    Key? key,
    required this.title,
    required this.body,
  }) : super(key: key);

  final Text title;
  final Widget body;

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
        );
    }
  }
}
