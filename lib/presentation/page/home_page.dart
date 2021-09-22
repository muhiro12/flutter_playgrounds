// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:flutter_playgrounds/presentation/model/app_route.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(toString()),
      ),
      body: SafeArea(
        child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            final AppRoute route = AppRoute.values[index];
            return ListTile(
              onTap: () => Navigator.of(context).pushNamed(route.name),
              title: Text(route.toString()),
            );
          },
          separatorBuilder: (_, __) => const Divider(),
          itemCount: AppRoute.values.length,
        ),
      ),
    );
  }
}
