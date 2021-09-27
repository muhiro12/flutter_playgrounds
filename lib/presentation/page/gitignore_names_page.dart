import 'package:flutter/material.dart';
import 'package:flutter_playgrounds/business/model/git_hub.dart';
import 'package:flutter_playgrounds/presentation/model/app_route.dart';
import 'package:flutter_playgrounds/presentation/model/bottom_tab.dart';
import 'package:flutter_playgrounds/presentation/model/bottom_tab_item.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GitignoreNamesPage extends ConsumerWidget {
  const GitignoreNamesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      bottomTabProvider,
      (BottomTab bottomTab) {
        if (bottomTab.item != BottomTabItem.gitHub ||
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
        child: ref.watch(allGitignoreNamesProvider).when(
              data: (List<String> gitignoreNames) => ListView.separated(
                itemBuilder: (_, int index) {
                  final String gitignoreName = gitignoreNames[index];
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
      ),
    );
  }
}
