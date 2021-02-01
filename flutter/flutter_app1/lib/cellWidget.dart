import 'package:flutter/material.dart';

class cellWidget extends StatelessWidget {
  final int index;
  cellWidget({this.index});
  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        Expanded(
          child: Row(
          children: [
            Expanded(child: cellA(income: "3.80%",title: "111",)),
            Expanded(child: cellB(titlea: "定期宝60号",titleb: "117天",titlec: "5万",)),
            Expanded(child: cellC(time: "02-02 09:00",buy: false,)),
          ],
        ),),
        Divider(height: 1,)
      ],
    );
  }
}
class cellA extends StatelessWidget {
  final String income;
  final String title;
  cellA({this.income,this.title});
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

class cellB extends StatelessWidget {
  final String titlea;
  final String titleb;
  final String titlec;

  cellB({this.titlea,this.titleb,this.titlec});

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

class cellC extends StatelessWidget {
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
