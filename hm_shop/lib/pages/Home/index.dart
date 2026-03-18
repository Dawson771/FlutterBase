import 'package:flutter/material.dart';
import 'package:hm_shop/components/Home/HmCategory.dart';
import 'package:hm_shop/components/Home/HmHot.dart';
import 'package:hm_shop/components/Home/HmMoreList.dart';
import 'package:hm_shop/components/Home/HmSlider.dart';
import 'package:hm_shop/components/Home/HmSuggestion.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  //获取滚动组件的内容
  List<Widget> _getScrollChildren() {
    return [
      //返回组件为包裹普通组件Widget的sliver家族的组件
      SliverToBoxAdapter(child: HmSlider()), //轮播图组件
      //放置分类组件
      SliverToBoxAdapter(child: SizedBox(height: 10)),

      //Sliver Grid SliverList只能纵向排列
      SliverToBoxAdapter(child: HmCategory()), //分类组件
      SliverToBoxAdapter(child: SizedBox(height: 10)),

      SliverToBoxAdapter(child: HmSuggestion()), //推荐组件
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(child: HmHot()),
              SizedBox(width: 10),
              Expanded(child: HmHot()),
            ],
          ),
        ),
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      HmMoreList(), //无限滚动列表,注意必须是返回sliver家族的组件
    ];
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: _getScrollChildren(),
    ); // slivers: 滚动组件  sliver家族的组件
  }
}
