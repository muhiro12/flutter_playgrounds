import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/lifecycle.dart';
import '../../../foundation/app_logger.dart';
import '../entity/message.dart';
import 'message_repository.dart';

final messageListProvider =
    StateNotifierProvider.autoDispose<MessageListNotifier, List<Message>>(
  (ref) => MessageListNotifier(
    [],
    ref.watch(messageRepositoryProvider),
    ref.watch(lifecycleProvider),
  ),
);

class MessageListNotifier extends StateNotifier<List<Message>> {
  MessageListNotifier(
    super.state,
    this.repository,
    AppLifecycleState lifecycle,
  ) {
    switch (lifecycle) {
      case AppLifecycleState.resumed:
        receive();
        timer = Timer.periodic(
          const Duration(seconds: 5),
          (timer) {
            logger.info('MessageListNotifier timer is called.');
            receive();
          },
        );
        break;
      default:
        logger.info('MessageListNotifier timer is canceled.');
        timer?.cancel();
        break;
    }
  }

  final MessageRepository repository;
  Timer? timer;

  @override
  void dispose() {
    logger.info('MessageListNotifier timer is canceled.');
    timer?.cancel();
    super.dispose();
  }

  Future<void> receive() async {
    final list = await repository.receive(lastId: state.lastOrNull?.id ?? '');
    if (list.isEmpty) {
      return;
    }
    state = [
      ...state,
      ...list,
    ];
  }

  Future<void> send() async {
    await repository.send(
      userIcon: Icons.account_circle,
      userName: 'userName',
      content: 'content',
    );
    receive();
  }
}
