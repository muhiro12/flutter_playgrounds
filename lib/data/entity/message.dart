import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';

@freezed
class Message with _$Message {
  const factory Message({
    required String id,
    required IconData userIcon,
    required String userName,
    required String content,
    required DateTime createdAt,
  }) = _Message;
}
