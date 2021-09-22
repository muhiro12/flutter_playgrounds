// Flutter imports:
import 'package:flutter/material.dart';

class DefaultTabPage extends StatelessWidget {
  const DefaultTabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(toString()),
          bottom: const TabBar(
            tabs: <Widget>[
              Text('zero'),
              Text('one'),
              Text('two'),
            ],
          ),
        ),
        body: const SafeArea(
          child: TabBarView(
            children: <Widget>[
              Center(child: Text('zero')),
              Center(child: Text('one')),
              Center(child: Text('two')),
            ],
          ),
        ),
      ),
    );
  }
}
