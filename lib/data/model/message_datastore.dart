import 'dart:async';
import 'dart:math';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playgrounds/business/model/playgrounds_logger.dart';
import 'package:flutter_playgrounds/data/entity/message.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final messageDatastoreProvider = Provider((_) => MessageDatastore());

class MessageDatastore {
  MessageDatastore() {
    var count = 0;
    Timer.periodic(
      const Duration(seconds: 3),
      (timer) {
        logger.info('MessageDatastore timer is called.');
        if (count > 50) {
          logger.info('MessageDatastore timer is canceled.');
          timer.cancel();
        }
        for (var i = 0; i < Random().nextInt(3) + 1; i++) {
          addRandomMessage();
        }
        count++;
      },
    );
  }

  final List<Message> _data = [];

  final _userInfomations = [
    MapEntry(
      Icons.man,
      WordPair.random().asPascalCase,
    ),
    MapEntry(
      Icons.woman,
      WordPair.random().asPascalCase,
    ),
    MapEntry(
      Icons.account_box,
      WordPair.random().asPascalCase,
    ),
    MapEntry(
      Icons.account_box_outlined,
      WordPair.random().asPascalCase,
    ),
    MapEntry(
      Icons.account_circle_outlined,
      WordPair.random().asPascalCase,
    ),
    MapEntry(
      Icons.no_accounts,
      WordPair.random().asPascalCase,
    ),
  ];

  List<Message> fetch({required String lastId}) {
    final index = _data.indexWhere((element) => element.id == lastId);
    if (index < 0) {
      return _data;
    }
    return _data.sublist(index + 1);
  }

  void add({
    required IconData userIcon,
    required String userName,
    required String content,
  }) {
    final message = Message(
      id: UniqueKey().toString(),
      userIcon: userIcon,
      userName: userName,
      content: content,
      createdAt: DateTime.now(),
    );
    _data.add(message);
  }

  void addRandomMessage() {
    final index = Random().nextInt(_userInfomations.length);
    final length = (index + 1) * 5;

    final message = Message(
      id: UniqueKey().toString(),
      userIcon: _userInfomations[index].key,
      userName: _userInfomations[index].value,
      content: generateWordPairs().take(length).toList().asMap().entries.map(
        (e) {
          if (e.key == 0) {
            return e.value.asPascalCase;
          } else if (e.key == length - 1) {
            return '${e.value.first}.';
          } else {
            return e.value.first;
          }
        },
      ).join(' '),
      createdAt: DateTime.now(),
    );

    _data.add(message);
  }
}
