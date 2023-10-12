import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../entity/message.dart';
import 'message_datastore.dart';

final messageRepositoryProvider = Provider<MessageRepository>(
    (ref) => MessageRepositoryImplements(ref.watch(messageDatastoreProvider)));

abstract class MessageRepository {
  Future<List<Message>> receive({required String lastId});
  Future<void> send({
    required IconData userIcon,
    required String userName,
    required String content,
  });
}

class MessageRepositoryImplements implements MessageRepository {
  MessageRepositoryImplements(this.datastore);

  final MessageDatastore datastore;

  @override
  Future<List<Message>> receive({required String lastId}) async {
    return datastore.fetch(lastId: lastId);
  }

  @override
  Future<void> send({
    required IconData userIcon,
    required String userName,
    required String content,
  }) async {
    datastore.add(
      userIcon: userIcon,
      userName: userName,
      content: content,
    );
  }
}
