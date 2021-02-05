

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:flutter_app1/work1/logkk.dart';

class searchWidget extends StatefulWidget {
  @override
  _searchWidgetState createState() => _searchWidgetState();
}

class _searchWidgetState extends State<searchWidget> {
  Map _dict;
  List list = List();
  void _searchWithKey(String key){
    if(key.length >0){
      http.Client()
          .get("https://m.touker.com/trade/deposit/channel/fundSearch.do?keyword=$key")
          .then((http.Response response) {
        Map bodyMap = convert.jsonDecode(response.body);
        LogUtil.v(bodyMap);

        setState(() {
          _dict = bodyMap;
        });
      });
    }

  }
  @override
  Widget build(BuildContext context) {

      if(_dict != null){
        list = _dict["result"];
      }


    return Scaffold(
        appBar: AppBar(
          title: Text("搜索",style: TextStyle(color: Colors.white),),
          backgroundColor: Color.fromRGBO(206, 53, 51,1.0),
        ),
        body: Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.fromLTRB(15, 5, 15, 0),
            child: CustomScrollView(
              slivers: [
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                        return Container(
                          color: Colors.white,
                          height: 30,
                          child: searchTextField(onChanged: _searchWithKey,),
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
                          height: 60,
                          child: list !=null?searchListCell(dict: list[index],):null,
                        );
                      },
                      childCount: list.length,
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
   ValueChanged<String> onChanged;
   searchTextField({this.onChanged});
  @override
  _searchTextFieldState createState() => _searchTextFieldState();
}

class _searchTextFieldState extends State<searchTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: TextField(
        //
        // onSubmitted: (value){
        //   print("------------文字提交触发（键盘按键）--");
        // },
        // onEditingComplete: (){
        //   print("----------------编辑完成---");
        // },
        onChanged: (value){
          widget.onChanged(value);
        },
        keyboardType: TextInputType.text,
        decoration:  InputDecoration(
          hintText: "基金代码/简称/拼音首字母",
          contentPadding: EdgeInsets.all(0.0),
          prefixIcon:  Icon(Icons.search,color: Colors.black54,), //输入框左边图标
          // suffixIcon: new Icon(Icons.delete), //输入框右边图片
          // icon: Icon(Icons.search_off),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: Colors.grey),
        ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(color: Colors.grey),
          ),

        ),

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              searchListCellA(income: dict["abbrName"],title: dict["securityCode"].toString(),),
              searchListCellB(titlea: dict["latest1weekTypeAverageYield"].toString(),titleb: "7日年化",),
              searchListCellC(),

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
    final size =MediaQuery.of(context).size;

    return Container(
      // alignment: Alignment.center,
      // color: Colors.yellow,
      width: size.width/2,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(income,style: TextStyle(
              fontSize: 16,
              color: Colors.black
          ),maxLines:1),
          Text(title,style: TextStyle(
              fontSize: 13,
              color: Colors.black38
          ),maxLines:1),
        ],
      ),
    );
  }
}

class searchListCellB extends StatelessWidget {
  final String titlea;
  final String titleb;


  searchListCellB({this.titlea,this.titleb});

  @override
  Widget build(BuildContext context) {
    return Container(
      // alignment: Alignment.center,
      width: 45,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(titlea,style: TextStyle(
              fontSize: 16,
              color: Colors.red,
          ),maxLines:1),
          Text(titleb,style: TextStyle(
              fontSize: 15,
              color: Colors.black38
          ),maxLines:1),
        ],
      ),
    );
  }
}

class searchListCellC extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 20,
      // alignment: Alignment.centerRight,
      child: MaterialButton(
        onPressed:()=>print("onPressed"),
        onHighlightChanged: (bool highlingt)=>print("onHighlightChanged-$highlingt"),
        onLongPress: ()=>print("onLongPress"),
        color: Colors.white,
        textColor: Colors.red,
        child: Text("立即申购",style: TextStyle(fontSize: 11),),
        padding: EdgeInsets.all(0),//内边距,文字与边框的距离
        shape: RoundedRectangleBorder( //边框形状
              borderRadius: BorderRadius.all(Radius.circular(3),),
              side: BorderSide(color: Colors.red,width: 1)
        ),
        elevation: 0.0, // 按钮阴影值。正常应该小于 5。值越大阴影背景越大

      ));

  }
}
