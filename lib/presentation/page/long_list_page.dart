// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:flutter_playgrounds/business/model/git_hub.dart';
import 'package:flutter_playgrounds/presentation/model/app_route.dart';
import 'package:flutter_playgrounds/presentation/model/bottom_tab.dart';
import 'package:flutter_playgrounds/presentation/model/bottom_tab_item.dart';

class LongListPage extends HookConsumerWidget {
  const LongListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      bottomTabProvider,
      (BottomTab bottomTab) {
        if (bottomTab.item != BottomTabItem.list ||
            bottomTab.item != bottomTab.oldItem) {
          return;
        }
        Navigator.of(context).popUntil((Route<dynamic> route) => route.isFirst);
        ref.refresh(allGitignoreNamesProvider);
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(toString()),
      ),
      body: SafeArea(
        bottom: false,
        child: ref.watch(allGitignoreNamesProvider).when(
              data: (List<String> gitignoreNames) => ListView.separated(
                itemBuilder: (_, int index) => ListTile(
                  onTap: () =>
                      Navigator.of(context).pushNamed(AppRoute.longList.name),
                  title: Text(gitignoreNames[index]),
                ),
                separatorBuilder: (_, __) => const Divider(),
                itemCount: gitignoreNames.length,
              ),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              error: (Object error, _) => Text(
                error.toString(),
              ),
            ),
      ),
    );
  }
}
