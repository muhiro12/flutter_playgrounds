import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../business/model/primary.dart';
import '../model/design_platform.dart';
import '../model/design_system.dart';

class PlatformScaffold extends ConsumerWidget {
  const PlatformScaffold({
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
    final designSystem = ref.watch(
      primaryProvider.select((Primary primary) => primary.designSystem),
    );
    switch (designSystem.platform(context)) {
      case DesignPlatform.material:
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
      case DesignPlatform.cupertino:
        if (ModalRoute.of(context)?.isFirst == true) {
          return CupertinoPageScaffold(
            child: NestedScrollView(
              headerSliverBuilder: (_, __) => <Widget>[
                CupertinoSliverNavigationBar(
                  largeTitle: title,
                  trailing: trailing,
                ),
              ],
              body: SafeArea(
                child: Material(
                  child: body,
                ),
              ),
            ),
          );
        } else {
          return CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: title,
              trailing: trailing,
            ),
            child: SafeArea(
              child: Material(
                child: body,
              ),
            ),
          );
        }
    }
  }
}
