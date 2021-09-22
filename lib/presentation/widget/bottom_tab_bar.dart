// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:flutter_playgrounds/presentation/model/bottom_tab.dart';
import 'package:flutter_playgrounds/presentation/model/bottom_tab_item.dart';

class BottomTabBar extends ConsumerWidget {
  const BottomTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final StateController<BottomTabItem> bottomTab =
        ref.watch(bottomTabProvider);
    return BottomNavigationBar(
      onTap: (int index) => bottomTab.state = BottomTabItem.values[index],
      currentIndex: BottomTabItem.values.indexOf(bottomTab.state),
      items: BottomTabItem.values
          .map(
            (BottomTabItem item) => BottomNavigationBarItem(
              icon: Icon(item.icon),
              label: item.label,
            ),
          )
          .toList(),
    );
  }
}
