import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../business/model/primary.dart';
import '../model/app_route.dart';
import '../model/bottom_tab.dart';
import '../model/bottom_tab_item.dart';
import '../widget/app_scaffold.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      bottomTabProvider,
      (BottomTab? oldValue, BottomTab newValue) {
        if (newValue.item != BottomTabItem.settings ||
            newValue.item != newValue.oldItem) {
          return;
        }
        Navigator.of(context).popUntil((Route<dynamic> route) => route.isFirst);
      },
    );
    return AppScaffold(
      title: Text(toString()),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: const Text('Color'),
            subtitle: Text(
              ref.watch(
                primaryProvider.select(
                  (Primary primary) => describeEnum(primary.color.toString()),
                ),
              ),
            ),
            onTap: () =>
                Navigator.of(context).pushNamed(AppRoute.primaryColor.name),
          ),
          ListTile(
            title: const Text('ThemeMode'),
            subtitle: Text(
              ref.watch(
                primaryProvider.select(
                  (Primary primary) => describeEnum(primary.themeMode),
                ),
              ),
            ),
            onTap: () =>
                Navigator.of(context).pushNamed(AppRoute.themeMode.name),
          ),
          ListTile(
            title: const Text('ThemeFlavor'),
            subtitle: Text(
              ref.watch(
                primaryProvider.select(
                  (Primary primary) =>
                      describeEnum(primary.themeFlavor.toString()),
                ),
              ),
            ),
            onTap: () =>
                Navigator.of(context).pushNamed(AppRoute.themeFlavor.name),
          ),
          ListTile(
            title: const Text('DesignSystem'),
            subtitle: Text(
              ref.watch(
                primaryProvider.select(
                  (Primary primary) =>
                      describeEnum(primary.designSystem.toString()),
                ),
              ),
            ),
            onTap: () =>
                Navigator.of(context).pushNamed(AppRoute.designSystem.name),
          ),
          const AboutListTile(),
        ],
      ),
    );
  }
}
