import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/bottom_tab.dart';
import '../../../common/bottom_tab_item.dart';
import '../../../foundation/app_route.dart';
import '../../app/widget/app_scaffold.dart';

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
      (BottomTab? oldValue, BottomTab newValue) {
        if (newValue.item != BottomTabItem.catalog ||
            newValue.item != newValue.oldItem) {
          return;
        }
        Navigator.of(context).popUntil((Route<dynamic> route) => route.isFirst);
      },
    );
    return AppScaffold(
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
