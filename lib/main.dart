import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TabBar & TabBarView',
      home: TabLayoutPage(),
    );
  }
}

class TabLayoutPage extends StatefulWidget {
  const TabLayoutPage({Key? key}) : super(key: key);

  @override
  State<TabLayoutPage> createState() => _TabLayoutPageState();
}

class _TabLayoutPageState extends State<TabLayoutPage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 5, vsync: this);

    _tabController.animateTo(2);
  }

  static const List<Tab> _tabs = [
    Tab(icon: Icon(Icons.looks_one), child: Text('Tap One')),
    Tab(icon: Icon(Icons.looks_two), child: Text('Tap Two')),
    Tab(icon: Icon(Icons.looks_3), child: Text('Tap Three')),
    Tab(icon: Icon(Icons.looks_4), child: Text('Tap Four')),
    Tab(icon: Icon(Icons.looks_5), child: Text('Tap Five')),
  ];

  static const List<Widget> _views = [
    Center(child: Text('Content of Tab One')),
    Center(child: Text('Content of Tab Two')),
    Center(child: Text('Content of Tab Three')),
    Center(child: Text('Content of Tab Four')),
    Center(child: Text('Content of Tab Five')),
    // Can use any kind of widgets. like image, button, input, etc...
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TabBar & TabBarView'),
          backgroundColor: Colors.green,
          bottom: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelStyle: const TextStyle(fontStyle: FontStyle.italic),
            overlayColor:
                MaterialStateColor.resolveWith((Set<MaterialState> state) {
              if (state.contains(MaterialState.pressed)) {
                return Colors.blueAccent;
              }

              if (state.contains(MaterialState.focused)) {
                return Colors.orange;
              } else if (state.contains(MaterialState.hovered)) {
                return Colors.blueAccent;
              }

              return Colors.transparent;
            }),
            indicatorWeight: 5,
            indicatorColor: Colors.amberAccent,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding: const EdgeInsets.all(5),
            indicator: BoxDecoration(
                border: Border.all(color: Colors.amberAccent),
                borderRadius: BorderRadius.circular(10),
                color: Colors.blueAccent),
            isScrollable: true,
            physics: const BouncingScrollPhysics(),
            onTap: (int index) {
              print('Tab $index you Tapped');
            },
            enableFeedback: true,
            tabs: _tabs,
          ),
        ),
        body: const TabBarView(
          children: _views,
          physics: BouncingScrollPhysics(),
        ),
      ),
    );
  }
}
