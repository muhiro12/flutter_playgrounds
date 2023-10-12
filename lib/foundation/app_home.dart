import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_playgrounds/foundation/app_route.dart';

class AppHome extends HookWidget {
  const AppHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeNotifier = useState<AppRoute?>(null);
    final gridView = GridView.count(
      crossAxisCount: 4,
      children: AppRoute.values
          .map(
            (route) => IconButton(
              onPressed: () => routeNotifier.value = route,
              icon: Icon(route.icon),
            ),
          )
          .toList(),
    );
    return Scaffold(
      body: routeNotifier.value == null ? gridView : routeNotifier.value!.page,
      floatingActionButton: FloatingActionButton(
        onPressed: () => routeNotifier.value = null,
        child: const Icon(Icons.crop_square_outlined),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
