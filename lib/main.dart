import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const String _title="Flutter　demoだお";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const MyHomePage(title: 'Home Page'),
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
  int _counter = 0;//使われる変数の初期化
  String _type="偶数";
  String _name="";
  void _incrementCounter() {//このHomePage で実際に使われる関数を前に定義してある
    setState(() {
      _counter++;
      if(_counter%2==0){
        _type="偶数";
      }else{
        _type="奇数";
      }
      print("プラスのボタンが押されました　>>$_counter is $_type");
    });
    }
  void _minusCounter(){
    setState(() {
      _counter--;
      if(_counter%2==0){
        _type="偶数";
      }else{
        _type="奇数";
      }
      print("マイナスのボタンが押されました>>$_counter is $_type");
    });
  }
  @override
  Widget build(BuildContext context) {//ここから実際の絵画が始まる
    return Scaffold(
      appBar: AppBar(
        title: Row(children: const [
          Icon(Icons.chrome_reader_mode),
          Text("フラッター"),
        ]),
      ),
      drawer: const Drawer(child: Center(child: Text("Drawer"))),
      endDrawer: const Drawer(child: Center(child: Text("EndDrawer"))),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
        Container(
        width: double.infinity,
        child: TextField(
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: '名前を記入してください',
          ),
          onChanged: (text){
            _name=text;
          }
        ),
        ),
      Text(
        'ようこそ　$_nameさん',
        style:TextStyle(
          fontSize: 20,
          color: Colors.white,
          backgroundColor: Colors.black,
        )
      ),
      Text(
        '$_counter',
        style: TextStyle(
          fontSize: 20,
          color:Colors.black
        ),
      ),
          Text('$_type',
              style: TextStyle(fontSize: 20, color: Colors.red)),
          TextButton(onPressed: ()=>{print("ボタンが押されました")},
              child: const Text("テキストボタン"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const[
              Icon(
                Icons.access_alarm,
                color: Colors.pink,
                size:35.0,
              ),
              Icon(
                Icons.access_time_filled_rounded,
                color:Colors.greenAccent,
                size: 35.0,
              ),
              Icon(
                Icons.account_box,
                color:Colors.yellowAccent,
                size: 35.0,
              ),
              Icon(
                Icons.account_tree_rounded,
                color: Colors.deepPurple,
                size: 35.0,
              )
            ],
          ),
          Row(
            //横にWidgetを配置する「列を実現するWidget」
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            //の要素を等間隔で表示するというプロパティ値
            children:[
              Container(
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(
                  color:Colors.pink,
                  )
                ),
              Icon(
                Icons.favorite,
                color: Colors.pink,
                size: 35.0,
              ),
              Icon(
                Icons.audiotrack,
                color: Colors.green,
                size: 40.0,
              ),
              Icon(
                Icons.beach_access,
                color: Colors.blue,
                size: 45.0,
              ),

            ],
          ),
        ],
      ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
          ),
            FloatingActionButton(
                onPressed: _minusCounter,
              tooltip:'minus',
              child:const Icon(Icons.add_box_outlined)
            )
          ],
        )
      );
  }
}
