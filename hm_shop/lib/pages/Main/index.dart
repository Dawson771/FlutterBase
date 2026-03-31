import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hm_shop/api/user.dart';
import 'package:hm_shop/pages/Cart/index.dart';
import 'package:hm_shop/pages/Category/index.dart';
import 'package:hm_shop/pages/Home/index.dart';
import 'package:hm_shop/pages/Mine/index.dart';
import 'package:hm_shop/stores/UserController.dart';
import 'package:hm_shop/utils/TokenManager.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  //定义数据根据数据进行渲染4个导航
  // 一般应用程序的导航是固定的
  final List<Map<String, String>> _tabList = [
    {
      "icon": "lib/assets/home1.png", //正常显示图标
      "icon_active": "lib/assets/home2.png", //选中显示图标
      "text": "首页",
    },
    {
      "icon": "lib/assets/mingcute_classify-line.png", //正常显示图标
      "icon_active": "lib/assets/mingcute_classify-fill.png", //选中显示图标
      "text": "分类",
    },
    {
      "icon": "lib/assets/icon-park-outline_shopping.png", //正常显示图标
      "icon_active": "lib/assets/icon-park-solid_shopping.png", //选中显示图标
      "text": "购物车",
    },
    {
      "icon": "lib/assets/tdesign_setting.png", //正常显示图标
      "icon_active": "lib/assets/tdesign_setting-filled.png", //选中显示图标
      "text": "我的",
    },
  ];
  // 返回获取底部导航栏
  List<BottomNavigationBarItem> _getTabBarWidget() {
    return List.generate(_tabList.length, (int index) {
      return BottomNavigationBarItem(
        icon: Image.asset(_tabList[index]["icon"]!, width: 30, height: 30),
        activeIcon: Image.asset(
          _tabList[index]["icon_active"]!,
          width: 30,
          height: 30,
        ),
        label: _tabList[index]["text"],
      );
    });
  }

  List<Widget> _getChildren() {
    return [HomeView(), CategoryView(), CartView(), MineView()];
  }

  @override
  void initState() {
    super.initState();
    _initUser();
  }

  final UserController _userController = Get.put(UserController());

  _initUser() async {
    // 获取用户信息
    // final userInfo = await UserViewModel.getUserInfo();
    // print(userInfo);
    print(
      "🔍 [MainPage] 开始初始化用户信息...初始化前 TokenManager 内存中的 token: '${tokenManager.getToken()}",
    );
    await tokenManager.init();

    final token = tokenManager.getToken();
    print("📦 [MainPage] 从磁盘加载后的 token: '$token'");
    print("📦 [MainPage] token 是否为空：${token.isEmpty}");

    if (token.isNotEmpty) {
      //如果 token 有值，那么获取用户信息
      print("✅ [MainPage] Token 存在，准备调用 getUserInfoAPI()");
      try {
        final userInfo = await getUserInfoAPI();
        print("✅ [MainPage] 获取用户信息成功：${userInfo.toString()}");
        _userController.updataUserInfo(userInfo);
      } catch (e) {
        print("❌ [MainPage] 获取用户信息失败：$e");
      }
    } else {
      print("⚠️ [MainPage] Token 为空，跳过用户信息加载");
    }
  }

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //SafeArea 避开安全区域组件
      body: SafeArea(
        child: IndexedStack(
          index: _currentIndex,
          children: _getChildren(), // 子组件多个时使用IndexedStack
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black, // 选中颜色
        showUnselectedLabels: true, // 显示未选中的标签
        unselectedItemColor: Colors.grey, // 未选中颜色
        onTap: (int index) {
          print(index);
          // 设置点击的索引
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        items: _getTabBarWidget(),
      ),
    );
  }
}
