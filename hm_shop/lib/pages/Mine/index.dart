import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hm_shop/api/mine.dart';
import 'package:hm_shop/components/Mine/HmGuess.dart';
import 'package:hm_shop/components/Home/HmMoreList.dart';
import 'package:hm_shop/stores/UserController.dart';
import 'package:hm_shop/utils/TokenManager.dart';
import 'package:hm_shop/utils/ToastUtils.dart';
import 'package:hm_shop/viewmodels/home.dart';
import 'package:hm_shop/viewmodels/user.dart';

/// 个人中心页面
///
/// 显示用户信息、会员卡、快捷操作、订单管理以及商品推荐列表
/// 支持滚动加载更多"猜你喜欢"商品数据
class MineView extends StatefulWidget {
  const MineView({super.key});

  @override
  _MineViewState createState() => _MineViewState();
}

/// 个人中心页面状态类
///
/// 管理页面 UI 状态、数据加载和滚动事件处理
class _MineViewState extends State<MineView> {
  final UserController _userController = Get.find();
  // ==================== Widget 构建方法区域 ====================

  /// 退出登录按钮组件
  ///
  /// 点击后弹出确认对话框，用户确认后执行退出登录操作
  /// 退出逻辑：
  /// 1. 清除 token（内存 + 磁盘）
  /// 2. 清空用户信息
  /// 3. 关闭对话框
  Widget _getLogout() {
    return _userController.user.value.id.isNotEmpty
        ? GestureDetector(
            onTap: () {
              // 显示退出确认对话框
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("确认退出登录吗？"),
                    content: const Text("此操作将清除本地保存的登录信息"),
                    actions: [
                      // 取消按钮：关闭对话框
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("取消"),
                      ),
                      // 确认按钮：执行退出登录
                      TextButton(
                        onPressed: () async {
                          // 1. 关闭对话框
                          Navigator.of(context).pop();

                          // 2. 清除 token（内存 + 磁盘）
                          await tokenManager.removeToken();

                          // 3. 清空用户信息
                          _userController.updataUserInfo(UserInfo.fromJson({}));

                          // 4. 提示退出成功
                          if (mounted) {
                            ToastUtils.showToast(context, "已退出登录");
                            print("✅ 用户已退出登录");
                          }
                        },
                        child: const Text("确认"),
                      ),
                    ],
                  );
                },
              );
            },
            child: const Text("退出"),
          )
        : Text("");
  }

  /// 页面头部组件
  ///
  /// 包含用户头像和登录状态显示
  /// - 背景：顶部到底部的渐变色（浅橙色系）
  /// - 头像：圆形头像，使用本地资源图片
  /// - 登录文本：点击跳转到登录页面
  Widget _buildHeader() {
    // 添加调试信息
    print("🔍 [MineView] 构建页面头部");
    print(
      "📦 [MineView] 当前 TokenManager 中的 token: '${TokenManager().getToken()}'",
    );
    print(
      "👤 [MineView] 当前用户信息 - id: '${_userController.user.value.id}', account: '${_userController.user.value.account}'",
    );

    return Container(
      // 渐变背景装饰
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter, // 渐变起始位置：顶部居中
          end: Alignment.bottomCenter, // 渐变结束位置：底部居中
          colors: [Color(0xFFFFF2E8), Color(0xFFFDF6F1)], // 渐变颜色列表
        ),
      ),
      // 内边距设置：左 20、右 40、上 80、下 20
      padding: const EdgeInsets.only(left: 20, right: 40, top: 80, bottom: 20),
      child: Row(
        children: [
          Obx(() {
            //头像
            final user = _userController.user.value;
            print(
              "🖼️ [MineView] 头像渲染 - id: ${user.id}, avatar: ${user.avatar}",
            );

            return CircleAvatar(
              // 圆形头像组件
              radius: 26, // 半径 26 像素
              backgroundImage: user.id.isNotEmpty
                  ? NetworkImage(user.avatar)
                  : const AssetImage("lib/assets/images/goods_avatar.png")
                        as ImageProvider,
            ); // 头像图片资源
          }),
          const SizedBox(width: 12), // 头像右侧间距
          Expanded(
            // 可伸缩布局，占据剩余空间
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // 子组件左对齐
              children: [
                Obx(() {
                  //登录文本渲染
                  //obx 必须有可监测的响应式数据
                  final user = _userController.user.value;
                  final isLoggedIn = user.id.isNotEmpty;

                  print(
                    "📝 [MineView] 登录文本渲染 - 是否登录：$isLoggedIn, 显示文本：${isLoggedIn ? user.account : '点击登录'}",
                  );

                  return GestureDetector(
                    // 登录文本手势检测
                    onTap: () {
                      if (!isLoggedIn) {
                        // // 未登录，跳转到登录页面
                        // // Navigator.of(context).pushNamed("/login");
                        // // 点击跳转到登录页面
                        Navigator.pushNamed(context, '/login');
                      } else {
                        print("ℹ️ [MineView] 已登录状态，点击无操作");
                      }
                    },
                    child: Text(
                      isLoggedIn ? user.account : "点击登录",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
          Obx(() => _getLogout()),
        ],
      ),
    );
  }

  /// 会员卡卡片组件
  ///
  /// 展示会员权益信息和开通入口
  /// - 背景色：橙色系
  /// - 内容：VIP 图标、会员权益文案、立即开通按钮
  Widget _buildVipCard() {
    return Padding(
      // 外部左右各 20 像素内边距
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        // 卡片内边距：水平 12、垂直 12
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 240, 192, 155), // 背景颜色
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), // 左上角圆角 10 像素
            topRight: Radius.circular(10), // 右上角圆角 10 像素
          ),
        ),
        child: Row(
          children: [
            // VIP 图标
            Image.asset(
              "lib/assets/images/ic_user_vip.png",
              width: 30,
              height: 30,
            ),
            const SizedBox(width: 10), // 图标右侧间距
            const Expanded(
              // 权益文案，占据剩余空间
              child: Text(
                '升级美荟商城会员，尊享无限免邮',
                style: TextStyle(
                  fontSize: 14,
                  color: Color.fromRGBO(126, 43, 26, 1), // 深棕色文字
                ),
              ),
            ),
            // 立即开通按钮
            TextButton(
              onPressed: () {}, // TODO: 待实现开通会员跳转逻辑
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromRGBO(126, 43, 26, 1), // 按钮背景色
                foregroundColor: Colors.white, // 按钮文字颜色
                padding: const EdgeInsets.symmetric(horizontal: 20), // 按钮内边距
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18), // 圆角边框
                ),
              ),
              child: const Text('立即开通', style: TextStyle(fontSize: 12)),
            ),
          ],
        ),
      ),
    );
  }

  /// 快捷操作区域组件
  ///
  /// 展示三个快捷功能入口：我的收藏、我的足迹、我的客服
  /// 使用白色圆角卡片包裹，横向均分排列
  Widget _buildQuickActions() {
    /// 快捷操作单项组件
    ///
    /// [pic] 图标资源路径
    /// [label] 功能标签文字
    Widget item(String pic, String label) {
      return Column(
        mainAxisSize: MainAxisSize.min, // 使用最小高度
        children: [
          // 功能图标
          Image.asset(pic, width: 30, height: 30, fit: BoxFit.cover),
          const SizedBox(height: 6), // 图标下方间距
          // 功能标签文字
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      );
    }

    return Padding(
      // 外部左右各 10 像素内边距
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        // 卡片样式设置
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white, // 白色背景
          borderRadius: BorderRadius.circular(10), // 圆角 10 像素
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround, // 子组件均分空间
          children: [
            // 我的收藏
            item("lib/assets/images/ic_user_collect.png", "我的收藏"),
            // 我的足迹
            item("lib/assets/images/ic_user_history.png", "我的足迹"),
            // 我的客服
            item("lib/assets/images/ic_user_unevaluated.png", "我的客服"),
          ],
        ),
      ),
    );
  }

  /// 订单管理模块组件
  ///
  /// 展示订单相关的五个快捷入口：
  /// 我的订单、待付款、待发货、待收货、待评价
  /// 使用带阴影的卡片提升视觉层次
  Widget _buildOrderModule() {
    /// 订单项组件
    ///
    /// [pic] 订单类型图标路径
    /// [label] 订单类型标签文字
    Widget orderItem(String pic, String label) {
      return Column(
        mainAxisSize: MainAxisSize.min, // 使用最小高度
        children: [
          // 订单类型图标
          Image.asset(pic, width: 30, height: 30, fit: BoxFit.cover),
          const SizedBox(height: 6), // 图标下方间距
          // 订单类型标签
          Text(
            label,
            style: const TextStyle(fontSize: 12, color: Colors.black),
          ),
        ],
      );
    }

    return Padding(
      // 外部左右 16、上下 10 内边距
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ), // 圆角边框
        elevation: 2, // 阴影高度，营造浮起效果
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white, // 白色背景
            borderRadius: BorderRadius.circular(10), // 圆角 10 像素
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // 子组件左对齐
            children: [
              // 模块标题
              const Text(
                "订单管理",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12), // 标题下方间距
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround, // 子组件均分空间
                children: [
                  // 我的订单
                  orderItem("lib/assets/images/ic_user_order.png", "我的订单"),
                  // 待付款
                  orderItem("lib/assets/images/ic_user_obligation.png", "待付款"),
                  // 待发货
                  orderItem("lib/assets/images/ic_user_unreceived.png", "待发货"),
                  // 待收货
                  orderItem("lib/assets/images/ic_user_unshipped.png", "待收货"),
                  // 待评价
                  orderItem("lib/assets/images/ic_user_unevaluated.png", "待评价"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ==================== 生命周期和数据加载区域 ====================

  /// 初始化方法
  ///
  /// 在 Widget 创建后调用，用于执行一次性初始化操作
  /// 1. 调用父类 initState
  /// 2. 加载"猜你喜欢"商品列表
  /// 3. 注册滚动监听事件
  @override
  void initState() {
    super.initState();
    _getGuessList(); // 首次加载商品数据
    _registerEvent(); // 注册滚动监听
  }

  /// 猜你喜欢商品列表数据
  ///
  /// 存储已加载的商品详情项，用于在列表中展示
  final List<GoodDetailItem> _list = [];

  /// 猜你喜欢请求参数
  ///
  /// page: 当前页码，初始为 1
  /// pageSize: 每页数据量，固定为 10
  final Map<String, dynamic> _params = {"page": 1, "pageSize": 10};

  /// 注册滚动监听事件
  ///
  /// 监听 CustomScrollView 的滚动位置
  /// 当滚动到距离底部 50 像素时，触发加载更多数据
  void _registerEvent() {
    _controller.addListener(() {
      // 判断是否接近底部（当前位置 >= 最大滚动距离 - 50）
      if (_controller.position.pixels >=
          (_controller.position.maxScrollExtent - 50)) {
        _getGuessList(); // 加载更多数据
      }
    });
  }

  /// 加载状态标志
  ///
  /// true: 正在加载数据，防止重复请求
  /// false: 未在加载，可以发起新请求
  bool _isLoading = false;

  /// 是否有更多数据标志
  ///
  /// true: 还有更多数据可加载
  /// false: 已加载全部数据，无需继续请求
  bool _hasMore = true;

  /// 获取"猜你喜欢"商品列表
  ///
  /// 异步方法，从服务器分页加载商品推荐数据
  /// 加载流程：
  /// 1. 检查加载状态和是否有更多数据
  /// 2. 发起 API 请求
  /// 3. 更新列表数据并刷新 UI
  /// 4. 更新分页参数和标志位
  void _getGuessList() async {
    // 如果正在加载或没有更多数据，直接返回
    if (_isLoading || !_hasMore) {
      return;
    }

    _isLoading = true; // 标记为加载中

    // 调用 API 获取数据
    final res = await getGuessListAPI(_params);

    _isLoading = false; // 重置加载状态

    // 如果返回数据为空，标记为无更多数据
    if (res.items.isEmpty) {
      _hasMore = false;
      return;
    }

    // 将新数据添加到列表
    _list.addAll(res.items);

    // 刷新 UI
    setState(() {});

    // 如果当前页码已达到总页数，标记为无更多数据
    if (_params["page"] >= res.pages) {
      _hasMore = false;
      return;
    }

    // 页码 +1，准备加载下一页
    _params["page"]++;
  }

  /// 滚动控制器
  ///
  /// 用于监听和控制 CustomScrollView 的滚动行为
  final ScrollController _controller = ScrollController();

  // ==================== UI 构建区域 ====================

  /// 构建页面主 UI
  ///
  /// 使用 CustomScrollView 创建可滚动视图
  /// 包含以下部分（从上到下）：
  /// 1. 头部区域
  /// 2. 会员卡卡片
  /// 3. 快捷操作
  /// 4. 订单管理模块
  /// 5. 猜你喜欢标题（吸顶效果）
  /// 6. 商品推荐列表
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _controller, // 绑定滚动控制器
      slivers: [
        // 普通组件适配为 Sliver
        SliverToBoxAdapter(child: _buildHeader()), // 头部
        SliverToBoxAdapter(child: _buildVipCard()), // 会员卡
        SliverToBoxAdapter(child: _buildQuickActions()), // 快捷操作
        SliverToBoxAdapter(child: _buildOrderModule()), // 订单管理
        // 持久化头部组件（吸顶效果）
        SliverPersistentHeader(
          delegate: HmGuess(), // 使用自定义 delegate 渲染标题
          pinned: true, // 固定在顶部，滚动时不会消失
        ),

        // 商品推荐列表组件
        HmMoreList(recommendList: _list), // 传入已加载的商品数据
      ],
    );
  }
}
