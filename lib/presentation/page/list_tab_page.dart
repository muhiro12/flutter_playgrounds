import 'package:flutter/material.dart';

class ListTabPage extends StatefulWidget {
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
        setState(() => {});
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
          children: [
            Placeholder(
              fallbackHeight: 100,
            ),
            Column(
              children: [
                TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  indicatorColor: Colors.transparent,
                  labelColor: Theme.of(context).primaryColor,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Text('zero'),
                    Text('one'),
                    Text('two'),
                  ],
                ),
                SizedBox(
                  height: 200,
                  child: Center(
                    child: [
                      Text('zero'),
                      Text('one'),
                      Text('two'),
                    ][_tabController.index],
                  ),
                )
              ],
            ),
            Placeholder(
              fallbackHeight: 100,
            ),
          ],
        ),
      ),
    );
  }
}
