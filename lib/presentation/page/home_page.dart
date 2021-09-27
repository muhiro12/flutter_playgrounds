import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_playgrounds/presentation/model/app_route.dart';
import 'package:flutter_playgrounds/presentation/model/bottom_tab.dart';
import 'package:flutter_playgrounds/presentation/model/bottom_tab_item.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookConsumerWidget {
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
    final int index = useStream<int>(
          Stream<int>.periodic(
            const Duration(seconds: 10),
            (_) => Random().nextInt(AppRoute.values.length),
          ),
        ).data ??
        0;
    return Scaffold(
      appBar: AppBar(
        title: Text(toString()),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  final AppRoute route = AppRoute.values[index];
                  return ListTile(
                    onTap: () => Navigator.of(context).pushNamed(route.name),
                    leading: Icon(route.icon),
                    title: Text(describeEnum(route)),
                  );
                },
                separatorBuilder: (_, __) => const Divider(),
                itemCount: AppRoute.values.length,
              ),
            ),
            Builder(
              builder: (BuildContext context) {
                final AppRoute route = AppRoute.values[index];
                return MaterialButton(
                  onPressed: () => Navigator.of(context).pushNamed(route.name),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            route.icon,
                            size: 48,
                            color: Theme.of(context).primaryColor,
                          ),
                          Text(
                            describeEnum(route),
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
