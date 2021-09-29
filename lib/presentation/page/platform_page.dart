import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_playgrounds/business/model/primary.dart';
import 'package:flutter_playgrounds/presentation/model/design_system.dart';
import 'package:flutter_playgrounds/presentation/widget/app_scaffold.dart';
import 'package:flutter_playgrounds/presentation/widget/platform_list_tile.dart';
import 'package:flutter_playgrounds/presentation/widget/platform_list_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
              children: [
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
