// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:flutter_playgrounds/presentation/model/bottom_tab_item.dart';

final ChangeNotifierProvider<BottomTab> bottomTabProvider =
    ChangeNotifierProvider<BottomTab>((_) => BottomTab());

class BottomTab extends ChangeNotifier {
  BottomTabItem _item = BottomTabItem.home;
  BottomTabItem _oldItem = BottomTabItem.home;

  BottomTabItem get item => _item;
  BottomTabItem get oldItem => _oldItem;

  void select(BottomTabItem newItem) {
    _oldItem = _item;
    _item = newItem;
    notifyListeners();
  }
}
