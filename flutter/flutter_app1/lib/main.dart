

import 'package:flutter/material.dart';
import 'package:flutter_app1/swiperView.dart';
import 'package:flutter_app1/cellWidget.dart';

main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: myhome(),
  ));
}
class myhome extends StatelessWidget {
  void _jumpSearch(){
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
            onPressed: _jumpSearch,
          )
        ],
      ),
      body: myBody(),
    );
  }
}
class MyItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 245,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage("asset/image/qingwa.jpg"),
                  fit: BoxFit.cover,
                )
            ),
            width: 60,
            height: 60,
          ),
          Align(
            child: Text("123"),
          )
        ],
      ),
    );
  }
}


class myBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size =MediaQuery.of(context).size;
    final width =size.width;
    final height =size.height;

    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: CustomScrollView(
          slivers: [
            SliverGrid(
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context,int index){
                      return MyItem();
                    },
                  childCount: 11
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
                        child: SwiperView(),
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
                        child: cellWidget(index: index,),
                      );
                    },
                    childCount: 10,
                )
            ),
          ],
        ),
      ),
    );
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
