
import 'dart:math';


import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


void main(){

  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("appBar"),
      ),
      body: myListViewSeparated(),
      backgroundColor: Colors.limeAccent,
    ),
  ));
}
class myListView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return ListView(

      /*设置滚动方向，默认垂直
      * 1.垂直方向时候：整体高度依据子控件总和，宽度则扩展到最大
      * 2.水平方向时候：整体宽度依据子控件总和，高度则扩展到最大
      * */
      scrollDirection: Axis.vertical,
      reverse: false,//是否反转ListView上面的children组件倒序进行排列

      /*非null则强制设置子控件宽/高，子控件自己设置的无效(全部一样就在这里设置)
      1.垂直方向---设置的是高度
      2.水平方向---设置的是宽度
      * */
      itemExtent: null,//默认 null

      /*是否收缩包装(是否根据子widget的总长度来设置ListView的长度)
      *false:滑动的时候可以超出 ListView的滚动方向，有回弹效果
      *true:滑动的时候不可以超出 ListView的滚动方向
      *   垂直方向:不能下拉
      *   水平方向:不能右滑
      * */
      shrinkWrap: false,//默认 false

      /* 滑动效果
      1.AlwaysScrollableScrollPhysics:总是可以滑动，且有回弹效果
      2.NeverScrollableScrollPhysics:完全禁止滚动
      3.BouncingScrollPhysics: 内容超过一屏 就是1的效果，不超过父控件则就是2的效果
      4.ClampingScrollPhysics：内容超过一屏 可以滑动，无回弹效果，不超过则不能滑动
      * */
      physics: BouncingScrollPhysics(),



      /* 是否可以监听滑动
       If the [primary] argument is true, the [controller] must be null.
      * */
      primary: true, // 默认true
      controller: null, // 滑动监听


      padding: EdgeInsets.all(0.0),

      // 设置预加载的区域 cacheExtent 强制设置为了 0.0，从而关闭了“预加载”
      cacheExtent: 5.0,


      /* 该属性表示是否将列表项（子组件）包裹在AutomaticKeepAlive 组件中；
      典型地，在一个懒加载列表中，如果将列表项包裹在AutomaticKeepAlive中，在该列表项滑出视口时它也不会被GC（垃圾回收），
      它会使用KeepAliveNotification来保存其状态。如果列表项自己维护其KeepAlive状态，那么此参数必须置为false
      */
      addAutomaticKeepAlives:true,
      /*该属性表示是否将列表项（子组件）包裹在RepaintBoundary组件中。
      当可滚动组件滚动时，将列表项包裹在RepaintBoundary中可以避免列表项重绘，
      但是当列表项重绘的开销非常小（如一个颜色块，或者一个较短的文本）时，不添加RepaintBoundary反而会更高效。
      和addAutomaticKeepAlive一样，如果列表项自己维护其KeepAlive状态，那么此参数必须置为false
      */
      addRepaintBoundaries: true,
      addSemanticIndexes: true,


      semanticChildCount: 1,
      dragStartBehavior: DragStartBehavior.start,
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
      clipBehavior: Clip.hardEdge,
      restorationId: "restorationId",

      // children参数，是一个列表，但这种方式只适合少量子组件的情况。子控件直接默认没有空隙
      children: __createChildren(),
      // children: [
      //   Container(width: 30,height: 45,color: ColorUtils.getRandomColor()),
      //   Container(width: 30,height: 30,color: ColorUtils.getRandomColor()),
      //   Container(width: 30,height: 50,color: ColorUtils.getRandomColor()),
      //   Container(width: 30,height: 70,color: ColorUtils.getRandomColor()),
      //   Container(width: 30,height: 90,color: ColorUtils.getRandomColor()),
      // ],
    );
  }

  List<Widget> __createChildren() {
    List<Widget> children = new List();
    for(int index = 0; index < 25; index ++) {
      // children.add(Text('dateListView$index', style: TextStyle(color: Colors.black, backgroundColor: Colors.orange)));
      children.add(Container(width: 50,height: 45,color: ColorUtils.getRandomColor()));
    }
    return children;
  }

}



class myListViewBulider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder:(BuildContext context, int index){
          return Container(width: 30,height: 45,color: ColorUtils.getRandomColor());
        },
        // 列表项的数量，如果为null，则为无限列表
        itemCount: null,
    );
  }
}



class myListViewSeparated extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (BuildContext context, int index){
          return Container(width: 30,height: 45,color: ColorUtils.getRandomColor());
        },
        separatorBuilder: (BuildContext context, int index){
          return Container(width: 30,height: 1,color: Colors.white);
        },
        // 列表项的数量，不能为null
        itemCount: 20
    );
  }
}

















class ColorUtils {
  ///获取随机颜色
  static Color getRandomColor() {
    return Color.fromARGB(
      255,
      Random.secure().nextInt(200),
      Random.secure().nextInt(200),
      Random.secure().nextInt(200),

    );
  }
  static Color getRandonWhightColor(Random random) {
    //0~255 0为完全透明 255 为不透明
    //这里生成的透明度取值范围为 10~200
    int a = random.nextInt(190) + 10;
    return Color.fromARGB(a, 255, 255, 255);
  }
}