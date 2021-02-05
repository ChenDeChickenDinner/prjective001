


import 'package:flutter/widgets.dart';

// framework.dart 文件


// abstract BuildContext
// abstract Element extends BuildContext
// abstract ComponentElement extends Element
// class  StatelessElement extends ComponentElement
// class  StatefulElement  extends ComponentElement
/* Widget与Element
1.Flutter中真正代表屏幕上显示元素的类是Element
2.Widget实际上就是Element的配置数据,Widget树实际上是一个配置树，而真正的UI渲染树是由Element构成
3.UI树的每一个Element节点都会对应一个Widget对象
4.一个Widget对象可以对应多个Element对象。这很好理解，根据同一份配置（Widget），可以创建多个实例 Element
 */
void test1(){

}

// Widget特性
/*
.abstract:
其本身是个abstract抽象类，不能实例化，只能实例化其子类

.immutable:
自身及其子类本身是不可变的，自身只能添加 final类型的变量

. key
key:自身的标识

.createElement:(要求子类实现)
调用此方法生成对应节点的Element对象

.canUpdate:(自己内部的接口)
Widget树重新build时判断是否需要创新创建新的Element


 */
void test2(){

}
// Widget的生命周期
/*

* */
void test3(){

}
// State的生命周期
/*

* */
void test4(){

}
// State中正确获取widget与context
/*

* */
void test5(){

}
// 在Widget树中获取State对象
/*

* */
void test6(){

}


/* StatelessWidget:无状态widget

StatelessElement createElement(){}:
自身重写了createElement()方法，返回一个 StatelessElement 类型的对象

Widget build(BuildContext context):
要求子类实现 build 方法返回 widget
 */

class myStatelseeWidget extends StatelessWidget {

  myStatelseeWidget(){
    print("1.构造函数");
  }
  @override
  Widget build(BuildContext context) {
    print("2.build执行");
    return Container();
  }
}



class _myStatefulWidget extends StatefulWidget {
  _myStatefulWidget(){
    print("widget:构造实例化");
  }
  @override
  _myStatefulWidgetState createState()=>_myStatefulWidgetState();
}

class _myStatefulWidgetState extends State<_myStatefulWidget> {

  _myStatefulWidgetState(){
    print("state:构造实例化");
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
    print("state:父级依赖发生变化");
  }

  @override
  void didUpdateWidget(_myStatefulWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("state:canUpdate");
  }

  @override
  Widget build(BuildContext context) {
    print("state:build,传递过来context=$context ");
    return Center();
  }

  @override
  // deactivate：停用
  void deactivate() {
    super.deactivate();
    print("state:暂时从树中被移除");
  }

  @override
  // dispose：处置
  void dispose() {
    super.dispose();
    print("state:从树中被移除后，永远不再使用了，释放资源");
  }

  @override
  void reassemble() {
    super.reassemble();
    print("state:热重载-重新组装");
  }



}

