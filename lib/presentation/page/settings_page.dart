import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playgrounds/business/model/primary.dart';
import 'package:flutter_playgrounds/presentation/model/app_route.dart';
import 'package:flutter_playgrounds/presentation/model/bottom_tab.dart';
import 'package:flutter_playgrounds/presentation/model/bottom_tab_item.dart';
import 'package:flutter_playgrounds/presentation/widget/app_scaffold.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      bottomTabProvider,
      (BottomTab bottomTab) {
        if (bottomTab.item != BottomTabItem.settings ||
            bottomTab.item != bottomTab.oldItem) {
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
          const Divider(),
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
          const Divider(),
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
          const Divider(),
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
          const Divider(),
          const AboutListTile(),
        ],
      ),
    );
  }
}
