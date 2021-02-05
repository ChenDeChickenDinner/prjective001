

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app1/work1/swiperView.dart';
import 'package:flutter_app1/work1/cellWidget.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:flutter_app1/work1/logkk.dart';
import 'package:flutter_app1/work1/item.dart';
import 'package:flutter_app1/work1/searchController.dart';
// main() {
//
//
//
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: myhome(),
//   ));
// }
class myhome extends StatelessWidget {


  void _jumpSearch(BuildContext context){
    print("_jumpSearch");
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("理财"),
        backgroundColor: Color.fromRGBO(206, 53, 51,1.0),
        actions: [
          IconButton(
            icon: Icon(Icons.search,color: Colors.white,size: 25,),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                  settings: RouteSettings(),
                  maintainState: true,
                  // fullscreenDialog: true,
                  builder: (context){
                    return searchWidget();
                  }
              ));
            },
          )
        ],
      ),
      body: mainDataWidget(),
    );
  }
}


class mainDataWidget extends StatefulWidget {


  @override
  _mainDataWidgetState createState() => _mainDataWidgetState();
}

class _mainDataWidgetState extends State<mainDataWidget> {
  Map _dict;
  Map _dictList;

  @override
  void initState() {

    http.Client()
        .get("https://m.touker.com/marketing/wealth/getFirstData.do")
        .then((http.Response response) {
      Map bodyMap = convert.jsonDecode(response.body);
      // LogUtil.v(bodyMap);

      setState(() {
        _dict = bodyMap;
      });
    });

    http.Client()
        .get("https://m.touker.com/marketing/wealth/getIndexData.do")
        .then((http.Response response) {
      Map bodyMap = convert.jsonDecode(response.body);
      // LogUtil.v(bodyMap);

      setState(() {
        _dictList = bodyMap;
      });
    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return myBody(dict:_dict,dictList: _dictList,);
  }
}


class myBody extends StatelessWidget {

  final Map dict;
  final Map dictList;

  // final List topMenuList;
  // final List bannerList;
  // final List bonusList;

  myBody({this.dict,this.dictList});

  @override
  Widget build(BuildContext context) {
    final size =MediaQuery.of(context).size;
    final width =size.width;



    if(dict != null && dictList != null){
      Map resulr = dict["result"];
      List topMenuList = resulr["topMenuList"];
      List bannerList = resulr["bannerList"];
      Map resulr2 = dictList["result"];
      List bonusList = resulr2["bonusList"];

      return Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: CustomScrollView(
            slivers: [
              SliverGrid(
                delegate: SliverChildBuilderDelegate(
                        (BuildContext context,int index){

                      return MyItem(dict: topMenuList[index],);
                    },
                    childCount: topMenuList.length
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0,
                    childAspectRatio: 1
                ),
              ),
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                        return Container(
                          color: Colors.white,
                          height: 105,
                          child: SwiperView(bannerList: bannerList,),
                        );
                      },
                      childCount: 1
                  )
              ),
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                        return Container(
                          color: Colors.white,
                          height: 170,
                          child: recommendWidget(),
                        );
                      },
                      childCount: 1
                  )
              ),
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return Container(
                        color: Colors.white,
                        height: 80,
                        child: cellWidget(index: index,dict: bonusList[index],),
                      );
                    },
                    childCount: bonusList.length,
                  )
              ),
            ],
          ),
        ),
      );
    }
    return Container();


  }
}


class recommendWidget  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 50,
            child: Text("精品推荐",style: TextStyle(
                fontSize: 16,
                color: Colors.black
            ),),
            alignment: Alignment.centerLeft,
          ),
          Container(
            height: 120,
            color: Color.fromRGBO(246, 246, 246, 0.5),
            child: Container(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Column(
                  children: [
                    Text("华宝现金宝A",style: TextStyle(
                        fontSize: 18,
                        color: Colors.black
                    ),),
                    Row(
                      children: [
                        Expanded(child: incomeWidget(income: "2.428%",title: "七日年化收益",),),
                        Expanded(child: incomeWidget(income: "0.7091%",title: "万份收益(01-29)",),),
                      ],
                    ),
                    MaterialButton(
                      onPressed:()=>print("onPressed"),
                      onHighlightChanged: (bool highlingt)=>print("onHighlightChanged-$highlingt"),
                      onLongPress: ()=>print("onLongPress"),
                      height: 25.0,
                      minWidth: 150.0,
                      color: Colors.red,
                      textColor: Colors.white,
                      child: Text("立即购买"),

                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class incomeWidget extends StatelessWidget {
  final String income;
  final String title;
  incomeWidget({this.income,this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Text(income,style: TextStyle(
              fontSize: 20,
              color: Colors.red
          ),),
          Text(title,style: TextStyle(
              fontSize: 12,
              color: Colors.black
          ),),
        ],
      ),
    );
  }
}
