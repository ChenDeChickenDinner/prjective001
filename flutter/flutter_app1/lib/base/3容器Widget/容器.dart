import 'dart:math';

import 'package:flutter/material.dart';
/* Container的大小
A.自己设置大小约束
B.根据情况自适应
  1.如果没有子widget则自适应到与父控件的大小
  2.有子widget则默认是适配子控件大小的，
  3.但当设置对齐方式时Container将会填满父控件
*  */
class myContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

      /*color和decoration是互斥的，
      1.如果同时设置它们则会报错！
      2.实际上，当指定color时，Container内会自动创建一个decoration
      * */
      // color: Colors.orange,
      decoration: null,

      //1.当没有子控件默认是自动撑大到父控件的大小
      child: Text('Container（容器）'),
      width: 200,
      height: 200,
      // padding: EdgeInsets.all(5),//内边距
      // margin: EdgeInsets.all(5),// 外边距

      //子 Widget 对齐方式
      alignment: Alignment.center,

      //设置最大/小宽、高来确定大小，constraints如果不设置，默认最小宽高是0，最大宽高是无限大（double.infinity）
      constraints: BoxConstraints.tightFor(width: 200.0, height: 150.0),

    );

  }
}




