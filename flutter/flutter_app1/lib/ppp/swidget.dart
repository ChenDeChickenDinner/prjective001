


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

/* Widget特性
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

/* StatefulWidget:有状态widget
StatefulElement createElement(){}:
 自身重写了createElement()方法，返回一个 StatefulElement 类型的对象

State createState();
要求子类实现 createState 方法返回 一个State

*/
class _myStatefulWidget extends StatefulWidget {
  _myStatefulWidget(){
    print("构造函数:widget实例化");
  }
  @override
  _myStatefulWidgetState createState()=>_myStatefulWidgetState();
}

class _myStatefulWidgetState extends State<_myStatefulWidget> {


  _myStatefulWidgetState(){
    print("传递过来widget=$widget");
    print("state构造实例化");
  }

  @override
  Widget build(BuildContext context) {
    print("传递过来context=$context");
    print("state 执行 build ");
    return Container();
  }


}

