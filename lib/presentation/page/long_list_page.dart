// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:flutter_playgrounds/business/repository/git_hub_repository.dart';
import 'package:flutter_playgrounds/presentation/model/app_route.dart';
import 'package:flutter_playgrounds/presentation/model/bottom_tab.dart';
import 'package:flutter_playgrounds/presentation/model/bottom_tab_item.dart';

class LongListPage extends HookConsumerWidget {
  const LongListPage({Key? key}) : super(key: key);

  GitHubRepository get _repository => GitHubRepositoryImplements();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ScrollController scrollController = useScrollController();
    final ValueNotifier<List<String>> list = useState(<String>[]);
    final ValueNotifier<bool> isLoading = useState(false);
    useMemoized(() {
      isLoading.value = true;
      _repository
          .gitignoreTemplates()
          .then(
            (List<String> value) => list.value = value,
          )
          .whenComplete(
            () => isLoading.value = false,
          );
      return null;
    });
    ref.listen(
      bottomTabProvider,
      (BottomTab bottomTab) {
        if (bottomTab.item != BottomTabItem.list ||
            bottomTab.item != bottomTab.oldItem) {
          return;
        }
        isLoading.value = true;
        _repository
            .gitignoreTemplates()
            .then(
              (List<String> value) => list.value = value,
            )
            .whenComplete(
              () => isLoading.value = false,
            );
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
        child: Stack(
          children: <Widget>[
            ListView.separated(
              controller: scrollController,
              itemBuilder: (_, int index) => ListTile(
                onTap: () =>
                    Navigator.of(context).pushNamed(AppRoute.longList.name),
                title: Text(list.value[index]),
              ),
              separatorBuilder: (_, __) => const Divider(),
              itemCount: list.value.length,
            ),
            Visibility(
              visible: isLoading.value,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
