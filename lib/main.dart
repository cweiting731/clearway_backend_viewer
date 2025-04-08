import 'package:flutter/material.dart';
import 'package:clearway_backend_viewer/view/list_page.dart';

void main() {
  runApp(const MyApp());
}

// 不會隨時間改變的 StatelessWidget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 清除右上方的Debug banner
      title: 'ClearWay',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Home Page'),
    );
  }
}

// 會隨時間改變的 StatefulWidget
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // "_"MyHomePageState 代表private class
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  // 狀態更新會重新build
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: tabList.length,
        child: Scaffold(
          appBar: AppBar(
            leading: Image.asset('assets/images/app_icon.png'),
            backgroundColor: Theme
                .of(context)
                .colorScheme
                .inversePrimary,
            title: Text(widget.title),
            bottom: TabBar(
                tabs: tabList.map((it) {
                  return Tab(text: it.title, icon: Icon(it.icon));
                }).toList()
            ),
          ),
          body: TabBarView(
              children: tabViewList
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        )
    );
  }
}

class TabChoice {
  final String title;
  final IconData icon;
  const TabChoice(this.title, this.icon);
}

const List<TabChoice> tabList = <TabChoice> [
  TabChoice("列表", Icons.list),
  TabChoice("地圖", Icons.location_on_sharp)
];

const List<Widget> tabViewList = <Widget> [
  ListPage(),
  Center(child: Text('Settings Page Content')),
];