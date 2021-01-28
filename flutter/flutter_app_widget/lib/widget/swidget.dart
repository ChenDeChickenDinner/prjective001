


// import 'package:flutter/widgets.dart';

// // framework.dart 文件
// /* 
// A.abstract 其本身是个abstract抽象类(解决自定义问题)
// 1.不能实例化，只能实例化其子类
// 2.一般是直接继承自它，因为需要手动实现UnimplementedError(很麻烦)
// 3.一般是利用 StatelessWidget 或者 StatefulWidget 来实现自定义 Widget

// B.@immutable 本身是不可变的(解决可变问题)
// 1.自身只能添加 final类型的变量
// 2.利用状态Widget
//  */
// class myWidget extends Widget {
//   final String name = "123";
//   @override
//   Element createElement() {
//     // TODO: implement createElement
//     throw UnimplementedError();
//   }

// }
// /*  abstract class StatelessWidget extends Widget {
// 1.无状态 Widget
// 2.需要实现 build 方法
// 3.
//  */
//  class  myStatelessWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//     );
//   }
// } 
// /* abstract class StatefulWidget extends Widget {
// 1.有状态 Widget
// 2.不需要实现 build 方法
// 3.要实现createState方法 返回一个 State实例
// 4.利用 State
//  1.可以添加变量
//  2.要求实现build 返回 一个 Widget
//  */
// class  myStatefulWidget extends StatefulWidget {
//   @override
//   myState createState() => myState();
// }
// /* abstract class State<T extends StatefulWidget> with Diagnosticable { 
// 1.一个单独的类，不是一个Widget
// 2.<T extends StatefulWidget>  限制
//  */
// class myState extends State<myStatefulWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
      
//     );
//   }
// }


// /* 
// 1.构造函数
// 2.build方法
//  */
// class myStatelessWidget2 extends StatelessWidget {
//   @override
//   myStatelessWidget() {
//     print("构造函数被调用");
//   }
//   Widget build(BuildContext context) {
//     print("build方法被调用");
//     return Container();
//   }
// }

// /* 

//  */
// class _myStatefulWidget extends StatefulWidget {
//   _myStatefulWidget() {
//     print("构造函数被调用");
//   }
//   @override
//   __myState createState() {
//     print("State被创建");
//     __myState();
//   }
// }

// class __myState extends State<_myStatefulWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
