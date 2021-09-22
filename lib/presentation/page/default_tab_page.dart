// Flutter imports:
import 'package:flutter/material.dart';

class DefaultTabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(toString()),
          bottom: TabBar(
            tabs: [
              Text('zero'),
              Text('one'),
              Text('two'),
            ],
          ),
        ),
        body: SafeArea(
          child: TabBarView(
            children: [
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
