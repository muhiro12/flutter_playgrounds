import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../lib/common/app_scaffold.dart';
import '../../../../../lib/common/bottom_tab.dart';
import '../../../../../lib/common/bottom_tab_item.dart';
import '../../../../../lib/foundation/app_route.dart';
import '../service/git_hub.dart';

class GitignoreNamesPage extends ConsumerWidget {
  const GitignoreNamesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      bottomTabProvider,
      (BottomTab? oldValue, BottomTab newValue) {
        if (newValue.item != BottomTabItem.gitHub ||
            newValue.item != newValue.oldItem) {
          return;
        }
        Navigator.of(context).popUntil((Route<dynamic> route) => route.isFirst);
        final _ = ref.refresh(allGitignoreNamesProvider);
      },
    );
    return AppScaffold(
      title: Text(toString()),
      body: ref.watch(allGitignoreNamesProvider).when(
            data: (List<String> gitignoreNames) => ListView.separated(
              itemBuilder: (_, int index) {
                final gitignoreName = gitignoreNames[index];
                return ListTile(
                  onTap: () => Navigator.of(context).pushNamed(
                    AppRoute.gitignore.name,
                    arguments: gitignoreName,
                  ),
                  title: Text(gitignoreName),
                );
              },
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
    );
  }
}
