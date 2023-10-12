import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../../../lib/common/app_scaffold.dart';
import '../../../../../lib/feature/scroll/service/scroll_item_list.dart';

class ItemScrollPage extends HookConsumerWidget {
  const ItemScrollPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(scrollItemListProvider);
    final notifier = ref.watch(scrollItemListProvider.notifier);

    final controller = useMemoized(() => ItemScrollController());
    final listener = useMemoized(() => ItemPositionsListener.create());

    final isLoading = useState(false);

    ref.listen(
      scrollItemListProvider,
      (previous, next) {
        WidgetsBinding.instance.addPostFrameCallback(
          (_) {
            if (previous != null && previous.firstOrNull != next.firstOrNull) {
              final index = next.indexOf(previous.first);
              controller.jumpTo(index: index);
            }
          },
        );
      },
    );

    listener.itemPositions.addListener(
      () async {
        print(listener.itemPositions.value.map((e) => e.index));
        if (!isLoading.value &&
            listener.itemPositions.value
                .where((element) => element.index == 0)
                .isNotEmpty) {
          isLoading.value = true;
          await notifier.loadPrevious();
          isLoading.value = false;
        }
      },
    );

    return AppScaffold(
      title: Text(toString()),
      body: Stack(
        children: [
          ScrollablePositionedList.separated(
            itemScrollController: controller,
            itemPositionsListener: listener,
            initialScrollIndex: state.length,
            physics: const ClampingScrollPhysics(),
            itemBuilder: (context, index) => ListTile(
              title: Text(state[index].toString()),
            ),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: state.length,
          ),
          Visibility(
            visible: isLoading.value,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }
}
