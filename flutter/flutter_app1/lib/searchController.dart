

import 'package:flutter/material.dart';


class searchWidget extends StatefulWidget {
  @override
  _searchWidgetState createState() => _searchWidgetState();
}

class _searchWidgetState extends State<searchWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("搜索"),
        ),
        body: Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: CustomScrollView(
              slivers: [
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                        return Container(
                          color: Colors.white,
                          height: 30,
                          child: searchTextField(),
                        );
                      },
                      childCount: 1,
                    )
                ),
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                        return Container(
                          color: Colors.white,
                          height: 80,
                          child: cellWidget(),
                        );
                      },
                      childCount: 10,
                    )
                ),

              ],
            ),
          ),
        )
    );
  }
}


class searchTextField extends StatefulWidget {
  @override
  _searchTextFieldState createState() => _searchTextFieldState();
}

class _searchTextFieldState extends State<searchTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: TextField(
        onSubmitted: (value){
          print("------------文字提交触发（键盘按键）--");
        },
        onEditingComplete: (){
          print("----------------编辑完成---");
        },
        onChanged: (value){
          print("----------------输入框中内容为:$value--");
        },
        keyboardType: TextInputType.text,
        decoration:  InputDecoration(
          hintText: "基金代码/简称/拼音首字母",
          contentPadding: EdgeInsets.all(10.0),
          prefixIcon:  Icon(Icons.search_off_outlined), //输入框左边图标
          // suffixIcon: new Icon(Icons.delete), //输入框右边图片
          // icon: Icon(Icons.search_off),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(color: Colors.grey),
        ),),

      )
    );
  }
}

class searchListCell extends StatelessWidget {
  final int index;
  final Map dict;
  searchListCell({this.index,this.dict});
  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        Expanded(
          child: Row(
            children: [
              Expanded(child: cellA(income: "3.80%",title: dict["yieldDesc"],)),
              Expanded(child: cellB(titlea: dict["title"],titleb: "*天",titlec: "*万",)),
              Expanded(child: cellC(time: "02-02 09:00",buy: false,)),
            ],
          ),),
        Divider(height: 1,)
      ],
    );
  }
}
class searchListCellA extends StatelessWidget {
  final String income;
  final String title;
  searchListCellA({this.income,this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      // alignment: Alignment.center,
      // color: Colors.yellow,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(income,style: TextStyle(
              fontSize: 22,
              color: Colors.red
          ),),
          Text("预计年化收益",style: TextStyle(
              fontSize: 11,
              color: Colors.black38
          ),),
        ],
      ),
    );
  }
}

class searchListCellB extends StatelessWidget {
  final String titlea;
  final String titleb;
  final String titlec;

  searchListCellB({this.titlea,this.titleb,this.titlec});

  @override
  Widget build(BuildContext context) {
    return Container(
      // alignment: Alignment.center,
      child: Column(
        children: [
          Text(titlea,style: TextStyle(
              fontSize: 15,
              color: Colors.black
          ),),
          Text.rich(TextSpan(
              children: [
                TextSpan(text: titleb,style: TextStyle(color: Colors.red,fontSize: 12),),
                TextSpan(text: "期|",style: TextStyle(color: Colors.black,fontSize: 12),),
                TextSpan(text: titlec,style: TextStyle(color: Colors.red,fontSize: 12),),
                TextSpan(text: "起购",style: TextStyle(color: Colors.black,fontSize: 12),),

              ]
          )),
        ],
      ),
    );
  }
}

class searchListCellC extends StatelessWidget {
  final String time;
  final bool buy ;
  cellC({this.time,this.buy});
  @override
  Widget build(BuildContext context) {
    if(buy){
      return Container(
        // alignment: Alignment.centerRight,
        child: MaterialButton(
          onPressed:()=>print("onPressed"),
          onHighlightChanged: (bool highlingt)=>print("onHighlightChanged-$highlingt"),
          onLongPress: ()=>print("onLongPress"),
          height: 30.0,
          minWidth: 50.0,
          color: Colors.red,
          textColor: Colors.white,
          child: Text("立即购买"),

        ),
      );
    }else{
      return Container(
        child: Container(
          // alignment: Alignment.centerRight,
          child: Column(
            children: [
              Text(time,style: TextStyle(
                  fontSize: 10,
                  color: Colors.black
              ),),
              Text("开发认购",style: TextStyle(
                  fontSize: 12,
                  color: Colors.black
              ),),
            ],
          ),
        ),
      );
    }

  }
}
