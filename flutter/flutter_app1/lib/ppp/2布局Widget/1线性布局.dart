import 'package:flutter/material.dart';
/*Row与Column：
1.根据子widget的内容大小，自适应到合适的大小

* */
class myFlex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal, //水平的 Row
      // direction: Axis.vertical, // 垂直的 Column
    );
  }
}

class myRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(width: 50,height: 50,color: Colors.blue,),
        Container(width: 20,height: 80,color: Colors.orange,),
        Container(width: 80,height: 100,color: Colors.teal,),
        Container(width: 50,height: 120,color: Colors.lightGreen,),
      ],

      /*mainAxisSize：表示Row在主轴(水平)方向占用的空间，
      * 默认是MainAxisSize.max，表示尽可能多的占用水平方向的空间，
      * 此时无论子widgets实际占用多少水平空间，Row的宽度始终等于水平方向的最大宽度；
      * 而MainAxisSize.min表示尽可能少的占用水平空间，
      * 当子组件没有占满水平剩余空间，则Row的实际宽度等于所有子组件占用的的水平空间
      * */
      mainAxisSize: MainAxisSize.max,



      // 决定水平方向上子控件的布局顺序  当mainAxis start end时候有影响
      textDirection:TextDirection.ltr,

      /*mainAxisAlignment：表示子组件水平空间内对齐方式，
      1.如果mainAxisSize值为MainAxisSize.min，则此属性无意义，因为子组件的宽度等于Row的宽度。
      2.只有当mainAxisSize的值为MainAxisSize.max时，此属性才有意义
      .start，从左边开始布局
      .end，从右边开始布局
      .center，从中间开始布局
      .spaceBetween，相邻两个widget之间的距离相等
      .spaceAround，子widget平均分配空间，最左最又的组件离边的边距，为两个widget边距的一半，具体请自行设置查看效果
      .spaceEvenly，子widget平均分配空间，包括最左最右的widget离边的空间
      * */
      mainAxisAlignment: MainAxisAlignment.start,




      /*决定垂直方向上子控件的布局顺序
      与CrossAxisAlignment.end， CrossAxisAlignment.start相互影响，选择使用
      * */
      verticalDirection: VerticalDirection.down,

      /*crossAxisAlignment：表示子组件在纵轴方向的对齐方式，Row的高度等于子组件中最高的子元素高
      .satrt//设置子元素上边对齐
      .end//设置子元素下边对齐
      .center,//子元素应该如何沿着横轴放置，默认中间对齐
      .stretch//每个子元素的上下对齐Row的上下边，相当于是拉伸操作
      .baseline,//相当于CrossAxisAlignment.start,但是需要配合textBaseline，不然会报错
      * */
      crossAxisAlignment: CrossAxisAlignment.center,

      //配合CrossAxisAlignment.baseline一起使用 子控件有文本的时候才有效果
      textBaseline: TextBaseline.alphabetic,

    );
  }
}

/*
MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
MainAxisSize mainAxisSize = MainAxisSize.max,
CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
TextDirection textDirection,
VerticalDirection verticalDirection = VerticalDirection.down,
TextBaseline textBaseline,
List<Widget> children = const <Widget>[],
* */
class myColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(width: 50,height: 50,color: Colors.blue,),
        Container(width: 20,height: 80,color: Colors.orange,),
        Container(width: 80,height: 100,color: Colors.teal,),
        Container(width: 50,height: 120,color: Colors.lightGreen,),
      ],
      // 默认值MainAxisSize.max，则Column会在垂直方向占用尽可能多的空间
      mainAxisSize: MainAxisSize.max,

      textDirection: TextDirection.ltr,
      verticalDirection: VerticalDirection.up,

      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,

      textBaseline: TextBaseline.alphabetic,

    );
  }
}

class rowAndColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightGreen,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max, //有效，外层Colum高度为整个屏幕
          children: [
            Container(
              color: Colors.blue,
              child: Column(
                mainAxisSize: MainAxisSize.max,//无效，内层Colum高度为实际高度
                children: [
                  Text("hello world"),
                  Text("I am Jack"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

