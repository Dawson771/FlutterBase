import 'package:dio/dio.dart';
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
  @override
  void initState() {
    super.initState();
    //发起网络请求
    _gerChannels(); //获取频道数据
  }

  List<Map<String, dynamic>> _list = [];
  void _gerChannels() async {
    // // var res = await DioUtils().get("channels");
    // // print(res.data);
    // DioUtils util = DioUtils(); //创建实例化对象
    // Response<dynamic> result = await util.get("channels");
    // print("1111");
    // setState(() {});
    // print(result);
    // print("2222");
    try {
      DioUtils util = DioUtils(); // 创建实例化对象
      Response<dynamic> result = await util.get("channels");

      setState(() {});
      print(result); // 现在可以正常打印
      print("3333333333333333333333333333");
      print(result.data);
      print("44444444444444444444444444444444");
      Map<String, dynamic> res = result.data as Map<String, dynamic>;
      print(res["data"]["channels"]);
      List data = res["data"]["channels"] as List;
      print(data);
      print("5555555555555555555555555555555555555555");
      _list = data.cast<Map<String, dynamic>>() as List<Map<String, dynamic>>;
      // cast 强制类型转换
      setState(() {});
      print(_list);
      //channels是一个后端支持前端跨域访问的接口
    } catch (e) {
      print("请求发生错误：$e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("频道管理")),
        body: GridView.extent(
          padding: EdgeInsets.all(10),
          maxCrossAxisExtent: 140,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: List.generate(_list.length, (index) {
            return ChannelsItem(
              item: _list[index],
              index: index,
              deleteChannels: (i) {
                print("点击了删除${_list[i]["id"]}按钮");
                _list.removeAt(i);
                setState(() {});
                print(_list);
              },
            );
          }),
        ),
      ),
    );
  }
}

class ChannelsItem extends StatelessWidget {
  final Map<String, dynamic> item;
  final int index;
  final Function(int index) deleteChannels;
  const ChannelsItem({
    Key? key,
    required this.item,
    required this.index,
    required this.deleteChannels,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          alignment: Alignment.center,
          color: Colors.blue,
          child: Text(
            item["name"] ?? "空",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        Positioned(
          child: IconButton(
            onPressed: () {
              print("11111点击了删除${item["id"]}按钮");
              deleteChannels(index);
            },
            icon: Icon(Icons.delete),
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}

//封装工具类
class DioUtils {
  final Dio _dio = Dio(); //创建dio实例对象
  DioUtils() {
    // //基础通信
    // _dio.options.baseUrl = "https://geek.itheima.net/v1_0/";
    // _dio.options.connectTimeout = Duration(seconds: 10);  //请求超时 连接
    // _dio.options.sendTimeout = Duration(seconds: 10);  //响应超时 发送
    // _dio.options.receiveTimeout = Duration(seconds: 10);  //接收超时
    _dio.options
      ..baseUrl = "https://geek.itheima.net/v1_0/"
      ..connectTimeout = Duration(seconds: 10)
      ..sendTimeout = Duration(seconds: 10)
      ..receiveTimeout = Duration(seconds: 10);

    //添加拦截器
    _addInterceptors();
  }
  void _addInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        // 请求拦截器
        onRequest: (context, handler) {
          // handler.next(requestOptions);//放过请求
          //handler.reject(error);//取消请求  拦截请求
          handler.next(context);
        },
        // 响应拦截器
        onResponse: (context, handler) {
          // http状态码  2xx成功 3xx  缓存问题 400 请求参数有问题 500  服务器错误
          // handler.reject(error);
          if (context.statusCode! >= 200 && context.statusCode! < 300) {
            handler.next(context); //放过响应
            return;
          }
          //说明异常
          handler.reject(
            DioException(requestOptions: context.requestOptions),
          ); //抛出异常
        },
        // 错误拦截器
        onError: (context, handler) {
          handler.reject(context);
        },
      ),
    );
  }

  //向外暴露一个get方法

  Future<Response<dynamic>> get(String url, {Map<String, dynamic>? params}) {
    return _dio.get(url, queryParameters: params);
  }
}
