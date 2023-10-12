import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CatalogView extends HookWidget {
  const CatalogView({
    Key? key,
    this.children = const <Widget>[],
  }) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final count = useState(2);
    return Column(
      children: <Widget>[
        Expanded(
          child: GridView.count(
            crossAxisCount: count.value,
            shrinkWrap: true,
            children: children,
          ),
        ),
        Slider(
          value: count.value / 10,
          min: 0.1,
          max: 0.3,
          onChanged: (double value) => count.value = (value * 10).toInt(),
        ),
      ],
    );
  }
}
