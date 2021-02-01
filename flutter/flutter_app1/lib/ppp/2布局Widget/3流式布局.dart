
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
    return  myWrap();
  }
}

class myWrap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal, //设置水平局部还是垂直布局

      alignment: WrapAlignment.start,//设置元素的起始位置
      runAlignment: WrapAlignment.start,

      /*
      WrapCrossAlignment.start 水平排列时控制全部子widgets的上部对齐，垂直排列时控制全部子widgets的左边对齐
      WrapCrossAlignment.end   水平排列时控制全部子widgets的下部对齐，垂直排列时控制全部子widgets的又边对齐
      WrapCrossAlignment.center 设置每一行的子Widgets剧中对齐
      * */
      crossAxisAlignment: WrapCrossAlignment.start,

      /*
      VerticalDirection.down 设置行列widgets的展示，正常显示
      VerticalDirection.up 倒序展示，比如，在direction: Axis.horizontal时有1、2、3行widgets，设置为up后，展示为3、2、1
       */
      verticalDirection: VerticalDirection.down,

      /* 设置每一行（列）的展示
      TextDirection.ltr 设置每一行（列）的子Widgets从左到右（从上到下）正常显示，正序排列
      TextDirection.rtl 设置每一行（列）的子Widgets倒序显示
      */
      textDirection: TextDirection.ltr,


      // 在direction: Axis.horizontal的时候指左右两个Widget的间距,在direction: Axis.vertical的时候指上下两个widget的间距
      spacing: 5.0,// 主轴(水平)方向间距
      runSpacing: 10.0, // 纵轴（垂直）方向间距

      children: [
        Chip(
          avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('A')),
          label: new Text('Hamilton'),
        ),
        Chip(
          avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('B')),
          label: new Text('Lafayette'),
        ),
        Chip(
          avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('C')),
          label: new Text('Mulligan'),
        ),
        Chip(
          avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('D')),
          label: new Text('Laurens'),
        ),
        Chip(
          avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('E')),
          label: new Text('Laurens'),
        ),
        Chip(
          avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('F')),
          label: new Text('Laurens'),
        ),
      ],
    );
  }
}
