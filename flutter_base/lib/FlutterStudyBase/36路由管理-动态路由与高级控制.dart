import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MainPage());
}

//路由管理 基本路由  material风格,只能有一个MaterialApp
class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/goodsList",
      routes: {
        "/goodsList": (context) => GoodsList(),
        "/goodsDetail": (context) {
          // var args = ModalRoute.of(context)?.settings.arguments as Map;
          return GoodsDetail();
        },
      }, //列表页详情页
    );
  }
}

//商品列表
class GoodsList extends StatefulWidget {
  GoodsList({Key? key}) : super(key: key);

  @override
  _GoodsListState createState() => _GoodsListState();
}

class _GoodsListState extends State<GoodsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("商品列表")),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: 100,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              // //点击列表项跳转到详情页
              Navigator.pushNamed(
                context,
                "GoodsDetail",
                arguments: {"id": index + 1},
              );
            },
          );
        },
      ),
    );
  }
}

//商品详情
class GoodsDetail extends StatefulWidget {
  GoodsDetail({Key? key}) : super(key: key);

  @override
  _GoodsDetailState createState() => _GoodsDetailState();
}

class _GoodsDetailState extends State<GoodsDetail> {
  String _id = "";
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      if (ModalRoute.of(context) != null) {
        // print(ModalRoute.of(context)?.settings.arguments);

        Map<String, dynamic> params =
            ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
        print("详情页 参数     $params");
        _id = params["id"].toString();
        print("详情页参数     获取到路由参数 $_id");
      }
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return Container(child: null);
  }
}
