import 'package:flutter/material.dart';
import 'package:hm_shop/api/home.dart';
import 'package:hm_shop/components/Home/HmCategory.dart';
import 'package:hm_shop/components/Home/HmHot.dart';
import 'package:hm_shop/components/Home/HmMoreList.dart';
import 'package:hm_shop/components/Home/HmSlider.dart';
import 'package:hm_shop/components/Home/HmSuggestion.dart';
import 'package:hm_shop/viewmodels/home.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  //推荐列表
  PreferenceResult _preferenceResult = PreferenceResult(
    id: "1",
    title: "推荐",
    subTypes: [],
  );
  // 热榜推荐
  PreferenceResult _inVogueSection = PreferenceResult(
    id: "",
    title: "",
    subTypes: [],
  );
  // 一站式推荐
  PreferenceResult _oneStopSection = PreferenceResult(
    id: "",
    title: "",
    subTypes: [],
  );

  //分类列表
  List<CategoryItem> _categoryList = [];
  //轮播图数据
  List<BannerItem> _bannerList = [
    // BannerItem(
    //   id: "1",
    //   imgUrl: "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/1.jpg",
    // ),
    // BannerItem(
    //   id: "2",
    //   imgUrl: "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/2.png",
    // ),
    // BannerItem(
    //   id: "3",
    //   imgUrl: "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/3.jpg",
    // ),
  ];
  //获取滚动组件的内容
  List<Widget> _getScrollChildren() {
    return [
      //返回组件为包裹普通组件Widget的sliver家族的组件
      SliverToBoxAdapter(child: HmSlider(bannerList: _bannerList)), //轮播图组件
      //放置分类组件
      SliverToBoxAdapter(child: SizedBox(height: 10)),

      //Sliver Grid SliverList只能纵向排列
      SliverToBoxAdapter(child: HmCategory(categoryList: _categoryList)), //分类组件
      SliverToBoxAdapter(child: SizedBox(height: 10)),

      SliverToBoxAdapter(
        child: HmSuggestion(preferenceResult: _preferenceResult),
      ), //推荐组件
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                child: Hmhot(rssult: _inVogueSection, type: "hot"),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Hmhot(rssult: _oneStopSection, type: "stop"),
              ),
            ],
          ),
        ),
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      HmMoreList(recommendList: _recommendList), //无限滚动列表,注意必须是返回sliver家族的组件
      // HmMoretList(recommendList: _recommendList),
    ];
  }

  @override
  void initState() {
    super.initState();
    _getBannerList();
    _getCategoryList();
    _getPreferenceList();
    _getInVogueList();
    _getOneStopList();
    _getRecommendList();
    _registerEvent();
  }

  //监听滚动到底部的事件
  void _registerEvent() {
    _scrollController.addListener(() {
      // print("滑动位置：${_scrollController.position.pixels}");
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 50) {
        print("滑动到底部");
        // _getMoreList();
        _getRecommendList();
      }
    });
  }

  //获取轮播图数据
  _getBannerList() async {
    _bannerList = await getBannerListAPI();
    setState(() {});
  }

  //获取分类列表数据
  _getCategoryList() async {
    _categoryList = await getCategoryListAPI();
    setState(() {});
  }

  //获取特惠推荐列表数据
  _getPreferenceList() async {
    _preferenceResult = await getSuggestionListAPI();
    setState(() {});
  }

  // 获取热榜推荐
  Future<void> _getInVogueList() async {
    _inVogueSection = await getInVogueListAPI();
    setState(() {});
  }

  // 获取一站式推荐
  Future<void> _getOneStopList() async {
    _oneStopSection = await getOneStopListAPI();
    setState(() {});
  }

  int _page = 1; //页码
  bool _isLoading = false; // 加载中
  bool _hasMore = true; // 是否有更多数据
  // 获取推荐列表数据
  List<GoodDetailItem> _recommendList = [];
  _getRecommendList() async {
    if (_isLoading || !_hasMore) {
      // 正在加载中 或者 没有更多数据   退出
      return;
    }
    _isLoading = true;
    int requestLimit = _page * 8;
    _recommendList = await getRecommendListAPI({"limit": requestLimit});
    _isLoading = false;
    setState(() {});
    if (_recommendList.length < requestLimit) {
      // 没有更多数据
      _hasMore = false;
    } else {
      // 还有更多数据
      _page++;
    }
  }

  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController, //滚动监听
      slivers: _getScrollChildren(),
    ); // slivers: 滚动组件  sliver家族的组件
  }
}
