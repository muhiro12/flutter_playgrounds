import 'package:flutter/cupertino.dart';
import 'package:flutter_playgrounds/foundation/app_route.dart';
import 'package:flutter_playgrounds/common/bottom_tab.dart';
import 'package:flutter_playgrounds/common/bottom_tab_item.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppHome extends ConsumerWidget {
  const AppHome({Key? key}) : super(key: key);

  List<BottomTabItem> get _items => BottomTabItem.values;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomTab = ref.watch(bottomTabProvider);
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        onTap: (int index) => bottomTab.select(_items[index]),
        currentIndex: _items.indexOf(bottomTab.item),
        items: _items
            .map(
              (BottomTabItem item) => BottomNavigationBarItem(
                icon: Icon(item.icon),
                label: item.label,
              ),
            )
            .toList(),
      ),
      tabBuilder: (_, int index) => CupertinoTabView(
        routes: <String, WidgetBuilder>{
          for (AppRoute route in AppRoute.values) route.name: (_) => route.page,
        },
        builder: (_) => _items[index].page,
      ),
    );
  }
}
