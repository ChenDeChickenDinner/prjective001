import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

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
  void didUpdateWidget(SwiperView oldWidget) {
    // imageList.removeRange(0, imageList.length-1);
    
    for (Map ob in widget.bannerList) {
      imageList.add(Image.network(
        ob["imgUrl"],
        fit: BoxFit.fill,
      ));
    }

    super.didUpdateWidget(oldWidget);

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
        itemCount: 4,
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
        onTap: (index) => print('点击了第$index'),
      ),
    );
  }

  Widget _swiperBuilder(BuildContext context, int index) {
    return (imageList[index]);
  }
}