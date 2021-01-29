

import 'package:flutter/material.dart';

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


void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MaterialApp",
      theme: ThemeData(
          primaryColor: Colors.orange
      ),
      home: homePage(),
    );
  }
}
class homePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AppBar"),
      ),
      body: Center(
        child: FlatButton(
            onPressed: ()=>jump(context,jumpWidget()),
            child: Text("jump")
        ),

      ),
    );
  }
}

class jumpWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return counterWidget();
    return Text("xxx");
  }

}


class counterWidget extends StatefulWidget {

  counterWidget(){
    print("widget:构造实例化");
  }

  @override
  _counterWidgetState createState() => _counterWidgetState();
}

class _counterWidgetState extends State<counterWidget> {
  int _counter = 0;
  _counterWidgetState(){
    print("state:构造实例化,传递过来widget=$widget");
  }
  @override
  void initState() {
    super.initState();
    print("state:第一次插入到Widget树");
  }

  @override
  //Dependencies：依存关系
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("state:依赖发生变化");
  }

  @override
  void didUpdateWidget(counterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("state:canUpdate-重新构建");
  }

  @override
  Widget build(BuildContext context) {
    print("state:build,传递过来context=$context ");
    return Center(
      child: FlatButton(
          onPressed: ()=>setState(()=>_counter++),
          child: Text("$_counter")
      ),

    );
  }

  @override
  // deactivate：停用
  void deactivate() {
    super.deactivate();
    print("state:从树中被移除");
  }

  @override
  // dispose：处置
  void dispose() {
    super.dispose();
    print("state:从树中被永久移除时调用");
  }

  @override
  void reassemble() {
    super.reassemble();
    print("state:热重载-重新组装");
  }


}

