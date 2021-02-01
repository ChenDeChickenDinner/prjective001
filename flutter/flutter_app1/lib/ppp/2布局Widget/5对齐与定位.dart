
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
    return  myCenter2();
  }
}

/* Align 对齐
1.包裹子组件，调整子组件在父组件内的位置
2.根据子组件的大小，调整包裹后的大小

alignment : 表示子组件在父组件中的起始位置。
AlignmentGeometry 是一个抽象类，
它有两个常用的子类：Alignment和 FractionalOffset，我们将在下面的示例中详细介绍。

widthFactor和heightFactor是用于确定Align 组件本身宽高的属性；
1.它们是两个缩放因子，会分别乘以子元素的宽、高，最终的结果就是Align 组件的宽高。
2.如果值为null，则组件的宽高将会占用尽可能多的空间

* */
class myAlign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      color: Colors.blue,
      // child: Text("myAlign_Text"),
      child: Align(
        child: Text("myAlign_Text"),

        // AlignmentGeometry：一个位置

        /* Alignment(this.x, this.y)
        1.x、y，分别表示在水平和垂直方向的偏移
        2.x:(-1到1)左边--->右边
        3.y:(-1到1)顶部--->底部
        * */

        /*FractionalOffset(double dx, double dy)
         1.FractionalOffset 的坐标原点为矩形的左侧顶点

        * */
        alignment: Alignment.topRight,
        // alignment: FractionalOffset(0.2, 0.6),

      ),
    );
  }
}

/* Center 继承自 Align
1.widthFactor或heightFactor为null时组件的宽高将会占用尽可能多的空间
* */
class myCenter1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.red),
      child: Center(
        child: Text("xxx"),
      ),
    );
  }
}
class myCenter2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.red),
      child: Center(
        child: Text("xxx"),
        widthFactor: 1,
        heightFactor: 1,
      ),
    );
  }
}
