


import 'package:flutter/material.dart';


void main(){

  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("appBar"),
      ),
      body: myButtonTheme(),
    ),
  ));
}



class myButtonTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white38,
      child: ButtonTheme(
        textTheme: ButtonTextTheme.normal,
        layoutBehavior: ButtonBarLayoutBehavior.padded,

        minWidth: 88,
        height: 36,
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        shape: RoundedRectangleBorder( //边框形状
            borderRadius: BorderRadius.all(Radius.circular(0))
        ),

        buttonColor: Colors.yellow,
        disabledColor: Colors.white38,
        focusColor: Colors.indigoAccent,
        hoverColor: Colors.black87,
        highlightColor: Colors.redAccent,


        alignedDropdown: false,
        // colorScheme:

        child: myBtn(),
      ),
    );
  }
}

class myBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final ButtonThemeData parentButtonTheme = ButtonTheme.of(context);
    print(parentButtonTheme.toString());

    return Container(
      child: Column(
        children: [
          MaterialButton(

            onPressed:(){
              print("单击");
            },
            onLongPress: (){

              print("长按");
            },
            onHighlightChanged: (bool highlingt){

              print("onHighlightChanged-$highlingt");
            },


            // 子控件可以设置大小
            child: Text("data",
              style: TextStyle(
                  backgroundColor: Colors.redAccent
              ),
            ),

            // //内边距,子控件与边框的距离，有个默认值？
            padding: EdgeInsets.all(0),

            /*按钮会最先保证保证子控件的大小以及内边距
             1.未设置：未达到88*36的宽高则 默认会有扩容到88*36的宽高
             2.有设置，设置宽高大于基本的则扩容到设置的，反之设置无效
            * */
            minWidth: 88,
            height: 36,
            /* 掌控按钮的大小
          方式一：精准掌握一切大小
          设置子控件大小 + 设置内边距+ minWidth=0，height=0
          方式二：大概掌握总大小
          设置minWidth  与 height 调整 padding，不设置子控件大小
          * */



            color: Colors.teal, //按钮背景色
            disabledColor: Colors.grey,//按钮处于disable时的背景色

            highlightColor: Colors.blue, //按钮按下时的颜色

            splashColor: null,//传空无效
            // splashColor: Colors.lightGreen,//波纹效果颜色
            // splashColor: color: Color(0x000000),无颜色


            focusColor:Colors.teal,// 当获取焦点时候背景色
            hoverColor: Colors.redAccent,// 当有指针悬停在上面时候背景色

            textColor: Colors.white, //按钮文字颜色
            disabledTextColor: Colors.amberAccent, //按钮处于disable时按钮文字颜色




            elevation: 5.0, // 按钮阴影值。正常应该小于 5。值越大阴影背景越大
            disabledElevation: 5.0, //禁用时的阴影值

            highlightElevation: 4.0,//按下时候的阴影值
            focusElevation: 2.0,
            hoverElevation: 3.0,




            shape: RoundedRectangleBorder( //边框形状
              /*
                 RoundedRectangleBorder 圆角矩形
                BeveledRectangleBorder 带斜角的长方形边框
                CircleBorder 圆形边框
                StadiumBorder 两端是半圆的边框
                * */
                borderRadius: BorderRadius.all(Radius.circular(0))
            ),


          ),
          // // 什么都没有
          // FlatButton(onPressed: null, child: Text("RaisedButton")),
          // // 默认背景色 灰色
          // RaisedButton(onPressed: null, child: Text("RaisedButton")),
          // // 默认背景色 白色，边框灰色
          // OutlineButton(onPressed: null, child: Text("OutlineButton")),

          // 背景透明，不带阴影；点击：(灰色背景高亮，波纹) 《可以设置宽高》
          FlatButton(onPressed: ()=>print("onPressed"), child: Text("RaisedButton")),

          // 背景透明，不带阴影，灰色边框；点击：(灰色背景高亮，波纹) 《边框按钮》《不可设置宽高》
          OutlineButton(onPressed: ()=>print("onPressed"), child: Text("OutlineButton")),

          // 灰色背景，带有阴影，无边框；点击：(灰色背景高亮，波纹) 《漂浮按钮》《不可设置宽高》
          RaisedButton(onPressed: ()=>print("onPressed"), child: Text("RaisedButton")),


          FlatButton.icon(
            icon: Icon(Icons.info),
            label: Text("详情"),
            onPressed: ()=>print("onPressed"),
            minWidth: 30,
            height: 50,
          ),


          RaisedButton.icon(
            icon: Icon(Icons.send),
            label: Text("发送"),
            onPressed: ()=>print("onPressed"),
          ),
          OutlineButton.icon(
            icon: Icon(Icons.add),
            label: Text("添加"),
            onPressed: ()=>print("onPressed"),
          ),

          IconButton(
            onPressed: ()=>print("onPressed"),
            icon: Icon(Icons.send),
          ),


        ],
      ),
    );
  }
}
class myButtonBarTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white38,
      child: ButtonBarTheme(
        data: ButtonBarThemeData(
            alignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            buttonTextTheme: ButtonTextTheme.normal,
            buttonMinWidth: 88,
            buttonHeight: 36,
            buttonPadding: EdgeInsets.symmetric(horizontal: 8.0),
            buttonAlignedDropdown: false,
            layoutBehavior:ButtonBarLayoutBehavior.padded,
            overflowDirection: VerticalDirection.down
        ),
        child: myButtonBar(),
      )
      ,
    );
  }
}
class myButtonBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    ButtonBarThemeData theme = ButtonBarTheme.of(context);
    print(theme);
    return Container(
      color: Colors.orange,
      child: ButtonBar(
        // MainAxisAlignment，主轴布局方式 :MainAxisAlignment.end
        alignment: MainAxisAlignment.end,

        // 主轴方向占据空间的值，:MainAxisSize.max
        mainAxisSize: MainAxisSize.max,

        // 当最小宽度过大，会纵向排列
        buttonMinWidth: 88, // 88.0
        buttonHeight: 36, //36.0

        // 即使设置为0最少也有个0.2的样子:EdgeInsets.symmetric(horizontal: 8.0),
        buttonPadding: EdgeInsets.symmetric(horizontal: 8.0),

        buttonTextTheme: ButtonTextTheme.normal,
        overflowButtonSpacing: 20,
        overflowDirection: VerticalDirection.down,
        layoutBehavior: ButtonBarLayoutBehavior.padded,

        children: [
          FlatButton(onPressed: ()=>print("onPressed"), child: Text("1"),color: Colors.white,),
          OutlineButton(onPressed: ()=>print("onPressed"), child: Text("2"),color: Colors.white,),
          RaisedButton(onPressed: ()=>print("onPressed"), child: Text("3"),color: Colors.white,),
        ],
      ),
    );
  }
}


