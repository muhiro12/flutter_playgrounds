import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:playground_flutter/page/home_page.dart';
import 'package:playground_flutter/route.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Playground Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: HomePage(),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
      onGenerateRoute: (settings) => AppRouteSettings(settings).routeSettings(),
    );
  }
}
