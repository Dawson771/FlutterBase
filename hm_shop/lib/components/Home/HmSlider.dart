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
  CarouselSliderController _controller = CarouselSliderController(); //控制轮播图
  int _currentIndex = 0;
  Widget _getSlider() {
    //从flutter中获取屏幕宽度
    final screenWidth = MediaQuery.of(context).size.width;
    //返回轮播图插件
    //根据渲染数据 渲染不同的选项
    return CarouselSlider(
      carouselController: _controller,
      items: List.generate(widget.bannerList.length, (int index) {
        return Image.network(
          widget.bannerList[index].imgUrl,
          fit: BoxFit.cover, // 填充方式
          width: screenWidth, //获取屏幕宽度
        );
      }),
      options: CarouselOptions(
        viewportFraction: 1,
        autoPlay: true,
        onPageChanged: (index, reason) {
          _currentIndex = index;
          setState(() {}); //刷新页面 状态更新
        },
      ),
    );
  }

  Widget _getSearch() {
    return Positioned(
      top: 10,
      left: 0,
      right: 0,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          alignment: Alignment.centerLeft,
          height: 40,
          decoration: BoxDecoration(
            color: Color.fromRGBO(0, 0, 0, 0.5),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            "搜索框",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }

  //导航指示灯
  Widget _getIndicator() {
    return Positioned(
      bottom: 10,
      left: 0,
      right: 0,
      child: SizedBox(
        height: 40,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.bannerList.length, (int index) {
            return GestureDetector(
              onTap: () {
                _controller.jumpToPage(index);
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                margin: EdgeInsets.symmetric(horizontal: 5), //左右间距5
                width: index == _currentIndex ? 40 : 20,
                height: 6,
                decoration: BoxDecoration(
                  color: index == _currentIndex
                      ? Colors.white
                      : Color.fromRGBO(0, 0, 0, 0.3),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // 轮播图组件  stack 轮播图 搜索框 导航指示灯
    return Stack(children: [_getSlider(), _getSearch(), _getIndicator()]);
    // return Container(
    //   height: 249,
    //   color: Colors.blue,
    //   // width: MediaQuery.of(context).size.width,       //获取屏幕宽度
    //   alignment: Alignment.center,
    //   child: Text("轮播图", style: TextStyle(fontSize: 20, color: Colors.red)),
    // );
  }
}
