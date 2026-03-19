import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels/home.dart';

class HmSlider extends StatefulWidget {
  final List<BannerItem> bannerList;
  HmSlider({Key? key, required this.bannerList}) : super(key: key);

  @override
  _HmSliderState createState() => _HmSliderState();
}

class _HmSliderState extends State<HmSlider> {
  Widget _getSlider() {
    //从flutter中获取屏幕宽度
    final screenWidth = MediaQuery.of(context).size.width;
    //返回轮播图插件
    //根据渲染数据 渲染不同的选项
    return CarouselSlider(
      items: List.generate(widget.bannerList.length, (int index) {
        return Image.network(
          widget.bannerList[index].imgUrl,
          fit: BoxFit.cover, // 填充方式
          width: screenWidth, //获取屏幕宽度
        );
      }),
      options: CarouselOptions(viewportFraction: 1, autoPlay: true),
    );
  }

  @override
  Widget build(BuildContext context) {
    // 轮播图组件  stack 轮播图 搜索框 导航指示灯
    return Stack(children: [_getSlider()]);
    // return Container(
    //   height: 249,
    //   color: Colors.blue,
    //   // width: MediaQuery.of(context).size.width,       //获取屏幕宽度
    //   alignment: Alignment.center,
    //   child: Text("轮播图", style: TextStyle(fontSize: 20, color: Colors.red)),
    // );
  }
}
