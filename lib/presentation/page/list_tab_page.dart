import 'package:flutter/material.dart';

class ListTabPage extends StatefulWidget {
  const ListTabPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ListTabPageState();
}

class _ListTabPageState extends State<ListTabPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        setState(() => <dynamic>{});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.toString()),
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
                  controller: _tabController,
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
                    ][_tabController.index],
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
