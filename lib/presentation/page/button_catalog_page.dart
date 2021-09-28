import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_playgrounds/presentation/widget/platform_scaffold.dart';

class ButtonCatalogPage extends HookWidget {
  const ButtonCatalogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int> count = useState(2);
    return PlatformScaffold(
      title: Text(toString()),
      body: Column(
        children: <Widget>[
          Expanded(
            child: GridView.count(
              crossAxisCount: count.value,
              shrinkWrap: true,
              children: <Widget>[
                const BackButton(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.smart_button),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Text'),
                ),
                const CloseButton(),
                DropdownButton<void>(
                  items: const <DropdownMenuItem<void>>[
                    DropdownMenuItem<void>(child: Text('Dropdown')),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Elevated'),
                ),
                MaterialButton(
                  onPressed: () {},
                  child: const Text('Material'),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: const Text('Outlined'),
                ),
                CupertinoButton(
                  child: const Text('Cupertino'),
                  onPressed: () {},
                ),
                PopupMenuButton<void>(
                  itemBuilder: (_) => const <PopupMenuItem<void>>[
                    PopupMenuItem<void>(child: Text('PopupMenuItem')),
                  ],
                ),
                RawMaterialButton(
                  onPressed: () {},
                  child: const Text('RawMaterial'),
                ),
                FloatingActionButton(
                  onPressed: () {},
                  child: const Icon(Icons.add),
                ),
                const TextSelectionToolbarTextButton(
                  child: Text('TextSelectionToolbarText'),
                  padding: EdgeInsets.all(8),
                ),
                const CupertinoTextSelectionToolbarButton(
                  child: Text('CupertinoTextSelectionToolbar'),
                ),
              ],
            ),
          ),
          Slider(
            value: count.value / 10,
            min: 0.1,
            max: 0.3,
            onChanged: (double value) => count.value = (value * 10).toInt(),
          ),
        ],
      ),
    );
  }
}
