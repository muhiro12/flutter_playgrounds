import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playgrounds/presentation/widget/app_scaffold.dart';
import 'package:flutter_playgrounds/presentation/widget/catalog_view.dart';

class ButtonCatalogPage extends StatelessWidget {
  const ButtonCatalogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: Text(toString()),
      body: CatalogView(
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
    );
  }
}
