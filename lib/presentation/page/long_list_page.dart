// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:flutter_playgrounds/presentation/model/app_route.dart';
import 'package:flutter_playgrounds/presentation/model/bottom_tab.dart';
import 'package:flutter_playgrounds/presentation/model/bottom_tab_item.dart';

class LongListPage extends HookConsumerWidget {
  const LongListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ScrollController scrollController = useScrollController();
    ref.listen(
      bottomTabProvider,
      (BottomTab bottomTab) {
        if (bottomTab.item != BottomTabItem.list ||
            bottomTab.item != bottomTab.oldItem) {
          return;
        }
        Navigator.of(context).popUntil((Route<dynamic> route) => route.isFirst);
        scrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.linear,
        );
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(toString()),
      ),
      body: SafeArea(
        bottom: false,
        child: ListView.separated(
          controller: scrollController,
          itemBuilder: (_, int index) => ListTile(
            onTap: () =>
                Navigator.of(context).pushNamed(AppRoute.longList.name),
            title: Text(index.toString()),
          ),
          separatorBuilder: (_, __) => const Divider(),
          itemCount: 100,
        ),
      ),
    );
  }
}
