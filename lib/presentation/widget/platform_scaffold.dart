import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playgrounds/business/model/primary.dart';
import 'package:flutter_playgrounds/presentation/model/design_settings.dart';
import 'package:flutter_playgrounds/presentation/model/design_system.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PlatformScaffold extends ConsumerWidget {
  const PlatformScaffold({
    Key? key,
    required this.title,
    required this.body,
  }) : super(key: key);

  final Text title;
  final Widget body;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final DesignSettings designSettings = ref.watch(
      primaryProvider.select((Primary primary) => primary.designSettings),
    );
    switch (designSettings.designSystem(context)) {
      case DesignSystem.material:
        return Scaffold(
          appBar: AppBar(
            title: title,
          ),
          body: SafeArea(
            child: body,
          ),
        );
      case DesignSystem.cupertino:
        if (ModalRoute.of(context)?.isFirst == true) {
          return CupertinoPageScaffold(
            child: NestedScrollView(
              headerSliverBuilder: (_, __) => <Widget>[
                CupertinoSliverNavigationBar(
                  largeTitle: title,
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
