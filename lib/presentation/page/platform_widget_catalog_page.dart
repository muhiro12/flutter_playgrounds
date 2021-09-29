import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_playgrounds/presentation/widget/catalog_view.dart';
import 'package:flutter_playgrounds/presentation/widget/platform_scaffold.dart';
import 'package:flutter_playgrounds/presentation/widget/platform_switch.dart';
import 'package:flutter_playgrounds/presentation/widget/platform_switch_list_tile.dart';

class PlatformWidgetCatelogPage extends HookWidget {
  const PlatformWidgetCatelogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      title: Text(toString()),
      body: CatalogView(
        children: <Widget>[
          PlatformSwitchListTile(
            value: true,
            onChanged: (_) {},
          ),
          PlatformSwitch(
            value: true,
            onChanged: (_) {},
          ),
        ],
      ),
    );
  }
}
