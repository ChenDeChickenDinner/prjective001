

import 'package:flutter/material.dart';



void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "flutter demo",
      theme: ThemeData(primarySwatch: Colors.orange),
      home: myHomePage(title:"Flutter demo homePage"),
    );
  }
}

class myHomePage extends StatefulWidget {
  myHomePage({Key key,this.title}):super(key: key);
  final String title;
  @override
  _myHomePageState createState() => _myHomePageState();
}

class _myHomePageState extends State<myHomePage> {
  int _counter = 0;
  void _incrementCounter(){
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("点击按钮增加数字"),
            Text("$_counter"),
            FlatButton(
              child: Text("jump"),
              textColor: Colors.red,
              onPressed: (){
                jump(context,myNewRouter());
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Increment",
        child: Icon(Icons.add),
        onPressed: _incrementCounter,
      ),
    );
  }
}

class myNewRouter extends StatefulWidget {
  @override
  _myNewRouterState createState() => _myNewRouterState();
}

class _myNewRouterState extends State<myNewRouter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("新界面"),
      ),
      body: Center(
        child: Text("This is new route"),
      ),
    );
  }
}

void jump(BuildContext context,Widget widget){
  Navigator.push(context, MaterialPageRoute(
      settings: RouteSettings(),
      maintainState: true,
      fullscreenDialog: true,
      builder: (context){
        return widget;
      }
  ));
}
