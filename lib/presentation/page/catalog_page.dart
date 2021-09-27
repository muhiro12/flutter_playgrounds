import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playgrounds/presentation/model/app_route.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<AppRoute> appRoutes = AppRoute.values
        .where(
          (AppRoute appRoute) =>
              appRoute != AppRoute.catalog && appRoute.name.contains('catalog'),
        )
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(toString()),
      ),
      body: SafeArea(
        child: ListView.separated(
          itemBuilder: (_, int index) => ListTile(
            title: Text(
              describeEnum(appRoutes[index]),
            ),
            onTap: () => Navigator.of(context).pushNamed(appRoutes[index].name),
          ),
          separatorBuilder: (_, __) => const Divider(),
          itemCount: appRoutes.length,
        ),
      ),
    );
  }
}
