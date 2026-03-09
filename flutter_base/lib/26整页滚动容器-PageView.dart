import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MainPage());
}

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0; //当前激活索引
  // TextEditingController _phoneController = TextEditingController(); //创建账号控制器
  // TextEditingController _pwdController = TextEditingController();
  ScrollController _controller = ScrollController(); //创建控制器
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("滚动组件body:CustomScrollView(),")),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Stack(
                children: [
                  Container(
                    color: Colors.blue,
                    height: 260,
                    alignment: Alignment.center,
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: 10,
                      itemBuilder: (BuildContext context, index) {
                        return Container(
                          alignment: Alignment.center,
                          child: Text(
                            "轮播图${index + 1}",
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                        );
                      },
                    ),
                    // child: Text(
                    //   "轮播图",
                    //   style: TextStyle(color: Colors.white, fontSize: 20),
                    // ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    height: 40,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(10, (index) {
                          return GestureDetector(
                            onTap: () {
                              print("点击了$index");
                              // _pageController.jumpToPage(index);
                              _pageController.animateToPage(
                                index,
                                duration: Duration(seconds: 1),
                                curve: Curves.easeInQuad,
                              );
                              setState(() {
                                _currentIndex = index;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 10),
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                color: _currentIndex == index
                                    ? Colors.red
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 20)),
            SliverPersistentHeader(
              delegate: _StickyCategory(),
              pinned: true, //固定吸顶
            ), //轮播图
            SliverToBoxAdapter(child: SizedBox(height: 20)),
            SliverList.separated(
              itemBuilder: (BuildContext context, index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.blue,
                  child: Text("我是第${index + 1}个"),
                );
              },
              separatorBuilder: (BuildContext context, index) {
                return Container(height: 2, color: Colors.white);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _StickyCategory extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    // TODO: implement build
    return Container(
      // margin: EdgeInsets.symmetric(vertical: 10),
      color: Colors.white,
      child: ListView.builder(
        itemCount: 100,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 10),
            width: 100,
            decoration: BoxDecoration(color: Colors.blue),
            child: Text("轮播图$index", style: TextStyle(color: Colors.white)),
          );
        },
      ),
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 70; //最大展开高度

  @override
  // TODO: implement minExtent
  double get minExtent => 40; //最小折叠高度

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return false; //build方法是否需要重新构建，false 表示不需要重新构建
  }
}
