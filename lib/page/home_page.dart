import 'package:flutter/material.dart';
import 'package:playground_flutter/route.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Playground'),
      ),
      body: ListView(
        children: [
          _Tile(appRoute: AppRoute.defaultTab),
        ],
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  _Tile({
    required this.appRoute,
  });

  final AppRoute appRoute;

  @override
  Widget build(BuildContext context) {
    final name = appRoute.name;
    return ListTile(
      onTap: () => Navigator.of(context).pushNamed(name),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name),
          Divider(),
        ],
      ),
    );
  }
}
