import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_app1/work1/webView.dart';
class SwiperView extends StatefulWidget {
  final List bannerList;
  SwiperView({this.bannerList});
  @override
  _SwiperViewState createState() => _SwiperViewState();
}

class _SwiperViewState extends State<SwiperView> {
  // 声明一个list，存放image Widget
  List<Widget> imageList = List();


  @override
  //Dependencies：依存关系
  void didChangeDependencies() {
    for (Map ob in widget.bannerList) {
      imageList.add(Image.network(
        ob["imgUrl"],
        fit: BoxFit.fill,
      ));
    }
    super.didChangeDependencies();
    print("state:依赖发生变化");
  }




  @override
  Widget build(BuildContext context) {
    return firstSwiperView();
  }

  Widget firstSwiperView() {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      width: MediaQuery.of(context).size.width,
      height: 300,
      child: Swiper(
        itemCount: imageList.length,
        itemBuilder: _swiperBuilder,
        pagination: SwiperPagination(
            alignment: Alignment.bottomRight,
            margin: const EdgeInsets.fromLTRB(0, 0, 20, 10),
            builder: DotSwiperPaginationBuilder(
                color: Colors.black54,
                activeColor: Colors.white
            )
        ),
        controller: SwiperController(),
        scrollDirection: Axis.horizontal,
        autoplay: true,
        onTap: (index){
         Map dict =  widget.bannerList[index];
         print(dict["jumpUrl"]);
         Navigator.push(context, MaterialPageRoute(
             settings: RouteSettings(),
          maintainState: true,
          // fullscreenDialog: true,
          builder: (context){
          return webViewWidget(url: dict["jumpUrl"],);
          }
          ));
        }
      ),
    );
  }

  Widget _swiperBuilder(BuildContext context, int index) {

    if(imageList.length <= 0){
      return Container();
    }
    return (imageList[index]);
  }
}