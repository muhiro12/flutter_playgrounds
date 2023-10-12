import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'bottom_tab_item.dart';

final ChangeNotifierProvider<BottomTab> bottomTabProvider =
    ChangeNotifierProvider<BottomTab>((_) => BottomTab());

class BottomTab extends ChangeNotifier {
  BottomTabItem _item = BottomTabItem.recent;
  BottomTabItem _oldItem = BottomTabItem.recent;

  BottomTabItem get item => _item;
  BottomTabItem get oldItem => _oldItem;

  void select(BottomTabItem newItem) {
    _oldItem = _item;
    _item = newItem;
    notifyListeners();
  }
}
