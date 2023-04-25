import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_playgrounds/business/model/message_list.dart';
import 'package:flutter_playgrounds/data/entity/message.dart';
import 'package:flutter_playgrounds/presentation/widget/app_scaffold.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MessagePage extends HookConsumerWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(messageListProvider);
    final notifier = ref.watch(messageListProvider.notifier);

    final scrollController = useScrollController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.position.maxScrollExtent -
              scrollController.position.pixels >
          1000) {
        return;
      }
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });

    return AppScaffold(
      title: Text(toString()),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                itemBuilder: (context, index) {
                  final message = state[index];
                  final isSelf = message.userName == 'userName';
                  return ListTile(
                    horizontalTitleGap: 4,
                    leading: isSelf ? _buildTime(message) : _buildIcon(message),
                    title: Container(
                      decoration: BoxDecoration(
                        color: isSelf
                            ? Theme.of(context).primaryColor.withOpacity(0.2)
                            : Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft:
                              isSelf ? const Radius.circular(8) : Radius.zero,
                          topRight: const Radius.circular(8),
                          bottomLeft: const Radius.circular(8),
                          bottomRight:
                              isSelf ? Radius.zero : const Radius.circular(8),
                        ),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Text(message.content),
                    ),
                    trailing:
                        isSelf ? _buildIcon(message) : _buildTime(message),
                  );
                },
                itemCount: state.length,
              ),
            ),
            Row(
              children: [
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16,
                    ),
                    child: TextField(),
                  ),
                ),
                IconButton(
                  onPressed: notifier.send,
                  icon: const Icon(Icons.send),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(Message message) {
    return Icon(message.userIcon);
  }

  Widget _buildTime(Message message) {
    return Text(message.createdAt.toString().substring(10, 16));
  }
}
