import 'package:flutter/material.dart';
import 'package:flutter_playgrounds/presentation/model/app_route.dart';
import 'package:flutter_playgrounds/presentation/model/bottom_tab.dart';
import 'package:flutter_playgrounds/presentation/model/bottom_tab_item.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      bottomTabProvider,
      (BottomTab bottomTab) {
        if (bottomTab.item != BottomTabItem.home ||
            bottomTab.item != bottomTab.oldItem) {
          return;
        }
        Navigator.of(context).popUntil((Route<dynamic> route) => route.isFirst);
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(toString()),
      ),
      body: SafeArea(
        child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            final AppRoute route = AppRoute.values[index];
            return ListTile(
              onTap: () => Navigator.of(context).pushNamed(route.name),
              title: Text(route.name.toString()),
            );
          },
          separatorBuilder: (_, __) => const Divider(),
          itemCount: AppRoute.values.length,
        ),
      ),
    );
  }
}
