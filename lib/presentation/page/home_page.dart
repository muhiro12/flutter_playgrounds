// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:flutter_playgrounds/presentation/model/app_route.dart';

class HomePage extends StatelessWidget {
  final List<AppRoute> items = [
    AppRoute.defaultTab,
    AppRoute.listTab,
    AppRoute.longList,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(toString()),
      ),
      body: SafeArea(
        child: ListView.separated(
          itemBuilder: (context, index) {
            final item = items[index];
            return ListTile(
              onTap: () => Navigator.of(context).pushNamed(item.name),
              title: Text(item.toString()),
            );
          },
          separatorBuilder: (context, index) => const Divider(),
          itemCount: items.length,
        ),
      ),
    );
  }
}
