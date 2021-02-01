import 'package:flutter/material.dart';

// Expanded组件可以使Row、Column、Flex等子组件在其主轴方向上展开并填充可用空间，是强制子组件填充可用空间。
// 在主轴上 先满足未被修饰的子widget，其余修饰的widget按照系数分配，修饰>指定宽高
// 当父级 主轴是 水平方向的 Row时:满足最大高度，按需分配宽度
// 当父级 主轴是 垂直方向的 Column时:满足最大宽度(即使超出可以范围)，按需分配高度
class myExpanded extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row( // 当父级 主轴是 水平方向的 Row时:满足最大高度(即使超出可以范围)，按需分配宽度
            children: [
              Container(color: Colors.blue,child: Text("Text1"),),
              Container(color: Colors.teal,child: Text("Text2"),),
              Container(color: Colors.amberAccent,child: Text("Text3"),),
            ],
          ),
          Row(
            children: [ // 最后2个虽然没有指定宽度，但Container的属性导致她是根据子widget来决定自身的尺寸
              Expanded(child: Container(color: Colors.blue,child: Text("Text1"),),),
              Container(color: Colors.teal,child: Text("Text2"),),
              Container(color: Colors.amberAccent,child: Text("Text33333"),),
            ],
          ),
          Row(
            children: [ // 三个按照比例来 默认都是1
              Expanded(child: Container(color: Colors.blue,child: Text("Text1"),),),
              Expanded(child: Container(color: Colors.teal,child: Text("Text2"),),),
              Expanded(child: Container(color: Colors.amberAccent,child: Text("Text3"),),),
            ],
          ),
          Row(
            children: [ // 三个按照比例来 1：2：3
              Expanded(flex: 1, child: Container(color: Colors.blue,child: Text("Text1"))),
              Expanded(flex: 2, child: Container(color: Colors.teal,child: Text("Text2"))),
              Expanded(flex: 3, child: Container(color: Colors.amberAccent,child: Text("Text3"))),
            ],
          ),
          Row(
            children: [ // 保证最后二个未被修饰的宽度，其余1个有修饰，按照修饰的来（修饰级别>设定）
              Expanded(child: Container(width: 60,height: 50,color: Colors.blue,),),
              Container(width: 100,height: 20,color: Colors.teal,),
              Container(width: 100,height: 100,color: Colors.amberAccent,),
            ],
          ),
          Row(
            children: [ // 保证最后一个未被修饰的宽度，其余2个有修饰，按照修饰的来（修饰级别>设定）
              Expanded(child: Container(width: 60,height: 50,color: Colors.blue,),),
              Expanded(child: Container(width: 80,height: 20,color: Colors.teal,),),
              Container(width: 50,height: 100,color: Colors.amberAccent,),
            ],
          ),
          Row(
            children: [// 虽然三个都有宽度，但三个都被，结果 修饰了 1：1：1（修饰级别>设定）
              Expanded(child: Container(width: 60,height: 50,color: Colors.blue,),),
              Expanded(child: Container(width: 80,height: 20,color: Colors.teal,),),
              Expanded(child: Container(width: 100,height: 100,color: Colors.amberAccent,),),
            ],
          ),
        ],
      ),
    );


  }
}
class myExpanded2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Column( // 当父级 主轴是 垂直方向的 Column时:满足最大宽度(即使超出可以范围)，按需分配高度
            children: [
              Container(color: Colors.blue,child: Text("Text1"),),
              Container(color: Colors.teal,child: Text("Text2"),),
              Container(color: Colors.amberAccent,child: Text("Text3"),),
            ],
          ),
          Column(
            children: [ // 最后2个虽然没有指定宽度，但Container的属性导致她是根据子widget来决定自身的尺寸
              Expanded(child: Container(color: Colors.blue,child: Text("Text1"),),),
              Container(color: Colors.teal,child: Text("Text2"),),
              Container(color: Colors.amberAccent,child: Text("Text33333"),),
            ],
          ),
          Column(
            children: [ // 三个按照比例来 默认都是1
              Expanded(child: Container(color: Colors.blue,child: Text("Text1"),),),
              Expanded(child: Container(color: Colors.teal,child: Text("Text2"),),),
              Expanded(child: Container(color: Colors.amberAccent,child: Text("Text3"),),),
            ],
          ),
          Column(
            children: [ // 三个按照比例来
              Expanded(flex: 1, child: Container(color: Colors.blue,child: Text("Text1"))),
              Expanded(flex: 2, child: Container(color: Colors.teal,child: Text("Text2"))),
              Expanded(flex: 3, child: Container(color: Colors.amberAccent,child: Text("Text3"))),
            ],
          ),
          Column(
            children: [ // 保证最后二个未被修饰的宽度，其余2个有修饰，按照修饰的来（修饰级别>设定）
              Expanded(child: Container(width: 30,height: 50,color: Colors.blue,),),
              Container(width: 10,height: 20,color: Colors.teal,),
              Container(width: 10,height: 10,color: Colors.amberAccent,),
            ],
          ),
          Column(
            children: [ // 保证最后一个未被修饰的宽度，其余2个有修饰，按照修饰的来（修饰级别>设定）
              Expanded(child: Container(width: 50,height: 50,color: Colors.blue,),),
              Expanded(child: Container(width: 60,height: 20,color: Colors.teal,),),
              Container(width: 20,height: 30,color: Colors.amberAccent,),
            ],
          ),
          Column(
            children: [//
              Expanded(child: Container(width: 15,height: 5,color: Colors.blue,),),
              Expanded(child: Container(width: 20,height: 20,color: Colors.teal,),),
              Expanded(child: Container(width: 60,height: 30,color: Colors.amberAccent,),),
            ],
          ),
        ],
      ),
    );


  }
}

class myFlexible extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: [
            Row(
              children: [
                // Flexible(child: null),
                Flexible(child: Container(color: Colors.blue,child: Text("Text1"),),),
                Flexible(child: Container(color: Colors.teal,child: Text("Text2"),),),
                Flexible(child: Container(color: Colors.amberAccent,child: Text("Text3"),),),
              ],
            ),
            Row(
              children: [
                // Flexible(child: null),
                Flexible(flex: 1,child: Container(color: Colors.blue,child: Text("Text1"),),),
                Flexible(flex: 2,child: Container(color: Colors.teal,child: Text("Text2"),),),
                Flexible(flex: 3,child: Container(color: Colors.amberAccent,child: Text("Text3"),),),
              ],
            ),
          ],
        )
    );
  }
}