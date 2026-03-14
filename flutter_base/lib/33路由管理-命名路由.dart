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
    //注册路由器
    return MaterialApp(
      initialRoute: "/detail", //初始路由
      routes: {
        "/list": (context) => ListPage(),
        "/detail": (context) {
          // 获取路由参数并转换为 int 类型，如果为空则默认为 0
          final args = ModalRoute.of(context)?.settings.arguments as int?;
          return DetailsPage(index: args ?? 0);
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
              //     builder: (context) => DetailsPage(index: index,),
              //   ),
              // );
              Navigator.pushNamed(context, "/detail"); //命名路由跳转
              print("点击了列表项$index");
            },
            child: Container(
              alignment: Alignment.center,
              color: Colors.blue,
              margin: EdgeInsets.only(top: 10),
              height: 100,
              child: Text(
                "列表项$index",
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
  final int index;
  DetailsPage({Key? key, required this.index}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("详情页")),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "/list");
              },
              child: Text("去列表页"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("详情页${widget.index}返回上一页"),
            ),
          ],
        ),
      ),
    );
  }
}
