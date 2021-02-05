
import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("appBar"),
      ),
      body: myBody(),
    ),
  ));
}
class myBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  myStack();
  }
}
/*
1.Stack 控件允许其子 Widget 按照创建的先后顺序进行层叠摆放，
2.Positioned 控件则用来控制这些子 Widget 的摆放位置。
3.需要注意的是，Positioned 控件只能在 Stack 中使用，在其他容器中使用会报错。
Stack({
  this.alignment = AlignmentDirectional.topStart,
  this.textDirection,
  this.fit = StackFit.loose,
  this.overflow = Overflow.clip,
  List<Widget> children = const <Widget>[],
})

const Positioned({
  Key key,
  this.left,
  this.top,
  this.right,
  this.bottom,
  this.width,
  this.height,
  @required Widget child,
})
*/
class myStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      // 用于确定alignment对齐的参考系
      textDirection: TextDirection.ltr,
      alignment: AlignmentDirectional.topStart,
      /*
      此参数用于确定没有定位的子组件如何去适应Stack的大小。
      StackFit.loose表示使用子组件的大小，StackFit.expand表示扩伸到Stack的大小
      * */
      fit: StackFit.loose,
      // 此属性决定如何显示超出Stack显示空间的子组件
      overflow: Overflow.clip,

      children: [
        Container(width: 300,height: 300,color: Colors.amberAccent,),
        Positioned(
          child: Container(color: Colors.green, width: 150, height: 150),// 叠加在黄色容器之上的绿色控件
          // 子控件大小，优先级>子控件自己的宽高
          width: 100.0,
          height: 100.0,
          left: 20,
          top: 20,
        ),
        Positioned(
          child: Container(color: Colors.red, width: 150, height: 150),// 叠加在黄色容器之上的绿色控件
          // 子控件大小，优先级>子控件自己的宽高
          width: 100.0,
          height: 100.0,
          left: 18,
          top: 70,
        ),
      ],
    );
  }
}
