
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
    return  myUnconstrainedBox();
  }
}


/* Padding: 填充容器
1.改变控件的内边距
dgeInsets:
fromLTRB(double left, double top, double right, double bottom)：分别指定四个方向的填充。
all(double value) : 所有方向均使用相同数值的填充。
only({left, top, right ,bottom })：可以设置具体某个方向的填充(可以同时指定多个方向)。
symmetric({ vertical, horizontal })：用于设置对称方向的填充，vertical指top和bottom，horizontal指left和right
* */
class mypadding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      // padding: EdgeInsets.fromLTRB(5, 5, 0, 0),
      // padding: EdgeInsets.all(5),
      padding: EdgeInsets.only(left: 0,top: 5),
      child: Text("Padding",style: TextStyle(color: Colors.blue),),
    );
  }
}



/* DecoratedBox 装饰性容器
1.可以在其子组件绘制前(或后)绘制一些装饰（Decoration），如背景、边框、渐变等

**/
class myDecoratedBox extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return DecoratedBox(
      child: Container(
        width: 200,
        height: 200,
        // color: Colors.teal,
      ),

      /*此属性决定在哪里绘制Decoration
      1.background：在子组件之后绘制，即背景装饰。
      2.foreground：在子组件之上绘制，即前景。
      **/
      position: DecorationPosition.background,

      /* decoration：代表将要绘制的装饰，它的类型为Decoration。
      1.Decoration是一个抽象类，它定义了一个接口 createBoxPainter()，
      2.子类的主要职责是需要通过实现它来创建一个画笔，该画笔用于绘制装饰
       **/
      decoration: BoxDecoration(
        color: Colors.orange,
        image: null,
        border:Border.all( // 边框
          color: Colors.redAccent,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(10.0), //圆角
        gradient: RadialGradient( //背景径向渐变
            colors: [Colors.red, Colors.orange],
            center: Alignment.topLeft,
            radius: .98
        ),
        boxShadow: [BoxShadow( //阴影
            color: Colors.orange,
            offset: Offset(2.0, 2.0),
            blurRadius: 4.0
        )
        ],
        backgroundBlendMode: null,
      ),
    );
  }
}
Widget redBox =DecoratedBox(
  decoration: BoxDecoration(color: Colors.red),
);

// Decorated:装饰的
// Constrained:受约束的

/*  限制性容器
BoxConstraints

BoxConstraints用于设置限制条件，它的定义如下：

const BoxConstraints({
  this.minWidth = 0.0, //最小宽度
  this.maxWidth = double.infinity, //最大宽度
  this.minHeight = 0.0, //最小高度
  this.maxHeight = double.infinity //最大高度
})
BoxConstraints还定义了一些便捷的构造函数，用于快速生成特定限制规则的BoxConstraints，
如BoxConstraints.tight(Size size)，它可以生成给定大小的限制；
如BoxConstraints.expand()可以生成一个尽可能大的用以填充另一个容器的B
* */
class myConstrainedBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: double.infinity,
        minHeight: 50.0,
      ),
      child: Container(
          height: 5.0,
          child: redBox
      ),
    );
  }
}
/*SizedBox用于给子元素指定固定的宽高
1.实际上SizedBox只是ConstrainedBox的一个定制
2.BoxConstraints(minHeight: 80.0,maxHeight: 80.0,minWidth: 80.0,maxWidth: 80.0)
* */
class mySizedBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 80,
      child: redBox,
    );
  }
}
/* 多重限制
*如果某一个组件有多个父级ConstrainedBox限制，那么最终会是哪个生效？
* 我们发现有多重限制时，对于minWidth和minHeight来说，是取父子中相应数值较大的。
* 实际上，只有这样才能保证父限制与子限制不冲突。
* */
class myConstrainedBoxs1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: BoxConstraints(minWidth: 60.0, minHeight: 60.0), //父
        child: ConstrainedBox(
          constraints: BoxConstraints(minWidth: 90.0, minHeight: 20.0),//子
          child: redBox,
        )
    );
  }
}
class myConstrainedBoxs2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: BoxConstraints(minWidth: 90.0, minHeight: 20.0),
        child: ConstrainedBox(
          constraints: BoxConstraints(minWidth: 60.0, minHeight: 60.0),
          child: redBox,
        )
    );
  }
}
/*
1.UnconstrainedBox对父组件限制的“去除”并非是真正的去除：上面例子中虽然红色区域大小是90×20，但上方仍然有80的空白空间。
2.也就是说父限制的minHeight(100.0)仍然是生效的，只不过它不影响最终子元素redBox的大小，但仍然还是占有相应的空间，
3.可以认为此时的父ConstrainedBox是作用于子UnconstrainedBox上，而redBox只受子ConstrainedBox限制，这一点请读者务必注意

那么有什么方法可以彻底去除父ConstrainedBox的限制吗？答案是否定的！

* */
class myUnconstrainedBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: BoxConstraints(minWidth: 60.0, minHeight: 100.0),  //父
        child: UnconstrainedBox( //“去除”父级限制
          child: ConstrainedBox(
            constraints: BoxConstraints(minWidth: 90.0, minHeight: 20.0),//子
            child: redBox,
          ),
        )
    );
  }
}
/*除了上面介绍的这些常用的尺寸限制类容器外，还有一些其他的尺寸限制类容器，
比如AspectRatio，它可以指定子组件的长宽比、
LimitedBox 用于指定最大宽高、
FractionallySizedBox 可以根据父容器宽高的百分比来设置子组件宽高等，
*/