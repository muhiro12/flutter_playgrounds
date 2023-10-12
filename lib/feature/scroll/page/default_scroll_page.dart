import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/app_scaffold.dart';
import '../service/scroll_item_list.dart';

class DefaultScrollPage extends HookConsumerWidget {
  const DefaultScrollPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(scrollItemListProvider);
    final notifier = ref.watch(scrollItemListProvider.notifier);

    final controller = useScrollController();

    final isLoading = useState(false);

    final screenHeight = MediaQuery.of(context).size.height;

    controller.addListener(
      () async {
        if (controller.position.pixels < screenHeight / 2 &&
            controller.position.userScrollDirection ==
                ScrollDirection.forward) {
          if (isLoading.value) {
            return;
          }
          isLoading.value = true;
          await notifier.loadPrevious();
          isLoading.value = false;
        }
      },
    );

    ref.listen(
      scrollItemListProvider,
      (previous, next) {
        if (previous == next) {
          return;
        }

        final extentAfter = controller.position.extentAfter;

        WidgetsBinding.instance.addPostFrameCallback(
          (_) {
            final max = controller.position.maxScrollExtent;
            if (previous == null || previous.isEmpty) {
              controller.jumpTo(max);
            } else if (previous.firstOrNull != next.firstOrNull) {
              controller.jumpTo(max - extentAfter);
            } else if (extentAfter < screenHeight) {
              controller.animateTo(
                max,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            }
          },
        );
      },
    );

    return AppScaffold(
      title: Text(toString()),
      body: Stack(
        children: [
          ListView.separated(
            controller: controller,
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
