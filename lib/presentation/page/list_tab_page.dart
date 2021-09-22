// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_hooks/flutter_hooks.dart';

class ListTabPage extends HookWidget {
  const ListTabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TabController tabController = useTabController(initialLength: 3);
    return Scaffold(
      appBar: AppBar(
        title: Text(toString()),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            const Placeholder(
              fallbackHeight: 100,
            ),
            Column(
              children: <Widget>[
                TabBar(
                  controller: tabController,
                  isScrollable: true,
                  indicatorColor: Colors.transparent,
                  labelColor: Theme.of(context).primaryColor,
                  unselectedLabelColor: Colors.grey,
                  tabs: const <Widget>[
                    Text('zero'),
                    Text('one'),
                    Text('two'),
                  ],
                ),
                SizedBox(
                  height: 200,
                  child: Center(
                    child: const <Widget>[
                      Text('zero'),
                      Text('one'),
                      Text('two'),
                    ][tabController.index],
                  ),
                )
              ],
            ),
            const Placeholder(
              fallbackHeight: 100,
            ),
          ],
        ),
      ),
    );
  }
}
