// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:flutter_playgrounds/presentation/model/bottom_tab_item.dart';

final StateProvider<BottomTabItem> bottomTabProvider =
    StateProvider<BottomTabItem>((_) => BottomTabItem.home);

