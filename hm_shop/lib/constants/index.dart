//全局常量
class GlobalConstants {
  // static 静态变量  只读   类加载时初始化   类加载时只执行一次
  //const  不可更改
  static const String BASE_URL = "https://meikou-api.itheima.net";
  static const int TIME_OUT = 10; //超时时间
  static const String SUCCESS_CODE = "1"; //成功状态码
}

//存放请求地址接口的常量
class HttpConstants {
  static const String BANNER_LIST = "/home/banner";
  static const String CATEGORY_LIST = "/home/category/head"; //分类列表
  static const String PRODUCT_LIST = "/hot/preference"; //推荐列表
}
