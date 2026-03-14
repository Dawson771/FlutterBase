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
      routes: {
        "/details": (context) {
          //接收参数
          var args = ModalRoute.of(context)?.settings.arguments as Map;
          print("路由 接收参数   $args");
          return DetailsPage();
        },
        "/list": (context) {
          return ListPage();
        },
      },
      home: ListPage(), //列表页详情页
    );
  }
}

//列表页
class ListPage extends StatefulWidget {
  ListPage({Key? key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("列表页")),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: 100,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              // //点击列表项跳转到详情页
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => DetailsPage(index: index),
              //   ),);
              print("列表  点击了列表项${index + 1}");
              Navigator.pushNamed(
                context,
                "/details",
                arguments: {"id": index + 1},
              );
            },
            child: Container(
              alignment: Alignment.center,
              color: Colors.blue,
              margin: EdgeInsets.only(top: 10),
              height: 100,
              child: Text(
                "列表项${index + 1}",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}

//详情页
class DetailsPage extends StatefulWidget {
  DetailsPage({Key? key}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  String _id = "";
  @override
  void initState() {
    super.initState();
    // 直接使用 widget.index，无需再次获取路由参数

    Future.microtask(() {
      if (ModalRoute.of(context) != null) {
        // print(ModalRoute.of(context)?.settings.arguments);

        Map<String, dynamic> params =
            ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
        print("详情页 参数     $params");
        _id = params["id"].toString();

        print("详情页参数     获取到路由参数 $_id");
        setState(() {});
      } else {
        print("详情页参数为空   未获取到路由参数");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("详情页")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("详情页 $_id ", style: TextStyle(fontSize: 24)),
            SizedBox(height: 20), // 使用 SizedBox 添加间距
            TextButton(
              onPressed: () {
                // Navigator.pop(context);
                Navigator.pushNamed(context, "/list");
              },
              child: Text("返回上一页"),
            ),
          ],
        ),
      ),
    );
  }
}
