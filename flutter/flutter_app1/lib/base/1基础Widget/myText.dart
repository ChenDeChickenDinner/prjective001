

import 'package:flutter/material.dart';


void main(){
  runApp(myRichText());
}

class myText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return  Text(
      "StatelessWidget"*4,

      // 文本对齐方式
      textAlign: TextAlign.left,
      // 文本排版方向
      textDirection: TextDirection.ltr,


      // 本要跨越的可选最大行数
      maxLines: 3,

      /*文本截断规则
      clip:
      fade:
      ellipsis:
      visible:
      * */
      overflow: TextOverflow.fade,

      // 设置文字的放大缩小
      // 例如，fontSize=10，this.textScaleFactor=2.0，最终得到的文字大小为10*2.0
      textScaleFactor: 1.0,

      style: TextStyle(
        fontFamily: "Courier",
        color: Colors.greenAccent,
        backgroundColor: Colors.grey,
        fontSize: 22,
        // 行高（最终会乘以fontSize，相当于一个倍数效果,所以不以设置过大，不能为0）
        height: 2, // 超过1的时候，文本是以底部开始显示，上面会留有区域

        //每个字母之间要添加的空间量
        letterSpacing: 2.0,
        //每个单词之间要添加的空间量（中文没法区分单词，只能识别空格）
        wordSpacing: 2.0,



        // 文字阴影（边框、圆角、阴影、形状、渐变、背景图像等）
        shadows: [
          Shadow(
              color: Colors.orange, blurRadius: 2.0, offset: Offset(1.0, 2.0))
        ],

        //字体粗细
        fontWeight: FontWeight.w100,
        //字体变体 italic 使用斜体  normal 使用直立
        fontStyle: FontStyle.italic,

        // 下划线风格 + 颜色
        decorationStyle: TextDecorationStyle.dashed,
        decorationColor: Colors.black,


        // 对齐文本的水平线
        textBaseline: TextBaseline.alphabetic,

        // background: Paint(),//文本背景色
        // foreground: Paint(),//文本前背景色，不能与color共同设置
        // 是否继承默认样式
        inherit: false,
        // height: 15.0 暂时不知道是什么意思
      ),
    );
  }
}
/*DefaultTextStyle 统一设置
*
* */

class myTexts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        child: DefaultTextStyle(
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.deepOrange,
              fontSize: 30,
            ),
            child: Column(
              children: [
                Text("123"),
                Text("456"),
                Text("789",
                  style: TextStyle(
                      color: Colors.yellow,
                      fontSize: 11
                  ),
                ),
              ],)
        ),
      ),
    );
  }
}
/*RichText 富文本
RichText 是 Flutter 富文本的 widget，但是 RichText 只负责 layout，具体的配置还要看 Flutter 提供的2个类型 span：TextSpan、WidgetSpan
TextSpan - 配合 textStyle 实现各种文字效果，可以添加点击事件
WidgetSpan - 可以添加其他类型的 widget，不过我就试了试图片
* */

class myRichText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        alignment: Alignment.center,
        color: Colors.white,
        child: RichText(text: TextSpan(
            children: [
              TextSpan(
                  text: "11111",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 18
                  )
              ),
              TextSpan(
                  text: "22222",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 25
                  )
              ),
              WidgetSpan(child: Icon(Icons.add,color: Colors.orange,))
            ]
        ),
          textAlign: TextAlign.left,
          textDirection: TextDirection.ltr,
        ),
      ),
    );
  }
}
