import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playgrounds/presentation/model/app_route.dart';
import 'package:flutter_playgrounds/presentation/model/bottom_tab.dart';
import 'package:flutter_playgrounds/presentation/model/bottom_tab_item.dart';
import 'package:flutter_playgrounds/presentation/widget/platform_scaffold.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CatalogPage extends ConsumerWidget {
  const CatalogPage({Key? key}) : super(key: key);

  List<AppRoute> get appRoutes => AppRoute.values
      .where(
        (AppRoute appRoute) =>
            appRoute != AppRoute.catalog && appRoute.name.contains('catalog'),
      )
      .toList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      bottomTabProvider,
      (BottomTab bottomTab) {
        if (bottomTab.item != BottomTabItem.catalog ||
            bottomTab.item != bottomTab.oldItem) {
          return;
        }
        Navigator.of(context).popUntil((Route<dynamic> route) => route.isFirst);
      },
    );
    return PlatformScaffold(
      title: Text(toString()),
      body: ListView.separated(
        itemBuilder: (_, int index) => ListTile(
          title: Text(
            describeEnum(appRoutes[index]),
          ),
          onTap: () => Navigator.of(context).pushNamed(appRoutes[index].name),
        ),
        separatorBuilder: (_, __) => const Divider(),
        itemCount: appRoutes.length,
      ),
    );
  }
}
