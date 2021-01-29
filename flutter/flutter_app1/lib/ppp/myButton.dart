

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

main() {

  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("appBar"),
      ),
      body: Center(
        child: myBtn(),
      ),
    ),
  ));

}


class myBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MaterialButton(
          onPressed:(){
            //接收一个方法，点击按钮时回调该方法。如果传null，则表示按钮禁用
            print("onPressed");
          },
          onHighlightChanged: (bool highlingt){
            // 高亮变化时回调，参数：是否高亮
            print("onHighlightChanged-$highlingt");
          },
          onLongPress: (){
            print("onPressed");
          },
          child: Text("MaterialButton"),
          enableFeedback: true,
          height: 50.0,
          minWidth: 200.0,

          color: Colors.black,
          textColor: Colors.white,
          splashColor: Colors.lightGreen,
          highlightColor: Colors.blue,
          disabledColor: Colors.red,
          disabledTextColor: Colors.amberAccent,
          focusColor:Colors.teal,
          textTheme: ButtonTextTheme.normal,//字体主题，取 ButtonTextTheme 提供的三种主题
          colorBrightness: Brightness.dark,//颜色亮度，设置了 textColor 无效。但是 dark 是白色 light 是黑色，不理解为啥。

          elevation: 5.0, // 按钮阴影值。正常应该小于 5。值越大阴影背景越大
          highlightElevation: 4.0,//按下时候的阴影值
          focusElevation: 2.0,
          hoverElevation: 3.0,
          disabledElevation: 5.0, //禁用时的阴影值

          padding: EdgeInsets.all(1.0),//内边距
          shape: RoundedRectangleBorder( //边框形状
            /*
               RoundedRectangleBorder 圆角矩形
              BeveledRectangleBorder 带斜角的长方形边框
              CircleBorder 圆形边框
              StadiumBorder 两端是半圆的边框
              * */
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),

          animationDuration: Duration(seconds: 3),//动画的持续时间
          mouseCursor: null,//鼠标光标
          focusNode: FocusNode(),
          autofocus: true,//自动对焦
          materialTapTargetSize: MaterialTapTargetSize.padded,
          clipBehavior: Clip.none, // 根据此选项，内容将被剪裁（或不剪辑）
          visualDensity: VisualDensity(),//视觉密度
        ),



        // 即"漂浮"按钮，它默认带有阴影和灰色背景。按下后，阴影会变大
        RaisedButton(
          onPressed:()=>print("onPressed"),
          onHighlightChanged: (bool highlingt)=>print("onHighlightChanged-$highlingt"),
          onLongPress: ()=>print("onLongPress"),

          child: Text("RaisedButton"),

        ),


        // 即扁平按钮，默认背景透明并不带阴影。按下后，会有背景色
        FlatButton(
          onPressed:()=>print("onPressed"),
          onHighlightChanged: (bool highlingt)=>print("onHighlightChanged-$highlingt"),
          onLongPress: ()=>print("onLongPress"),

          child: Text("FlatButton"),
          minWidth: 200.0,
          height: 50.0,
        ),


        // 默认有一个边框，不带阴影且背景透明。按下后，边框颜色会变亮、同时出现背景和阴影(较弱)
        OutlineButton(
          onPressed:()=>print("onPressed"),
          // onHighlightChanged: (bool highlingt)=>print("onHighlightChanged-$highlingt"),
          onLongPress: ()=>print("onLongPress"),

          child: Text("OutlineButton"),
        ),

        //一个可点击的Icon，不包括文字，默认没有背景，点击后会出现背景
        IconButton(
          onPressed: ()=>print("onPressed"),
          icon: Icon(Icons.thumb_up),
          iconSize: 20.0,
        ),

        RaisedButton.icon(
          onPressed: (){
            print("点击发送");
          },
          icon: Icon(Icons.send),
          label: Text("发送"),

        ),
        FlatButton.icon(onPressed: null, icon: Icon(Icons.info), label: Text("详情"),),
        OutlineButton.icon(onPressed: null, icon: Icon(Icons.add), label: Text("添加"),),
      ],
    );
  }
}

