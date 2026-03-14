import 'package:dio/dio.dart';

void main(List<String> args) {
  DioUtils util = DioUtils(); //创建实例化对象
  util.get("channels").then((res) {
    print(res.data);
  });
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
