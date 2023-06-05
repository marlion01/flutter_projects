import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _type="偶数";
  void _incrementCounter() {
    setState(() {
      _counter++;
      print("Hello world");
      if(_counter%2==0){
        _type="偶数";
      }else{
        _type="奇数";
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: const [
          Icon(Icons.create),
          Text("初めてのタイトル"),
        ]),
      ),
      drawer: const Drawer(child: Center(child: Text("Drawer"))),
      endDrawer: const Drawer(child: Center(child: Text("EndDrawer"))),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Hello world"),
          const Text("ハローワールド"),
          TextButton(onPressed: ()=>{print("ボタンが押されました")},
              child: const Text("テキストボタン"),
          ),
          Row(
            //横にWidgetを配置する「列を実現するWidget」
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            //の要素を等間隔で表示するというプロパティ値
            children:const[
              Icon(
                Icons.favorite,
                color: Colors.pink,
                size: 24.0,
              ),
              Icon(
                Icons.audiotrack,
                color: Colors.green,
                size: 30.0,
              ),
              Icon(
                Icons.beach_access,
                color: Colors.blue,
                size: 36.0,
              ),
            ]
          ),
          const Text(
            'You have pushed the button this many times:',
          ),
          Text(
            '$_counter',
            style: Theme.of(context).textTheme.headline4,
          ),
          Text('$_type', style: TextStyle(fontSize: 20, color: Colors.red))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
