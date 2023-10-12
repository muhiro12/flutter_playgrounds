import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/app_scaffold.dart';
import '../service/design_system.dart';
import '../service/primary.dart';
import '../widget/platform_list_tile.dart';
import '../widget/platform_list_view.dart';

class PlatformPage extends HookConsumerWidget {
  const PlatformPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppScaffold(
      title: Text(toString()),
      body: Column(
        children: <Widget>[
          Expanded(
            child: PlatformListView(
              children: <Widget>[
                const PlatformListTile(
                  title: Text('Title'),
                ),
                const PlatformListTile(
                  title: Text('Title'),
                  subtitle: Text('Subtitle'),
                ),
                PlatformListTile(
                  title: const Text('Title'),
                  subtitle: const Text('Subtitle'),
                  onTap: () {},
                ),
              ],
            ),
          ),
          Slider(
            value: ref.watch(primaryProvider).designSystem.index / 10,
            min: 0,
            max: 0.2,
            onChanged: (_) {},
            onChangeEnd: (double value) => ref
                .read(primaryProvider)
                .selectDesignSystem(DesignSystem.values[(value * 10).toInt()]),
          ),
        ],
      ),
    );
  }
}
