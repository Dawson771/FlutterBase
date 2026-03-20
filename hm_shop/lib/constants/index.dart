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
}

//"id:"1181622001
// 'name":"气质女装
// "picture":"https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c1/qznz.png",
// "children":
// "id":"1191110001"
// "name:"半裙”，
// "picture":"https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/qznz_bq.png?quality=95&imageView",
// "children":null,
// "goods":null
// "id":"1191110002",
// "name":"衬衫
// "picture":"https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/qznz_cs.png?quality=95&imageView",
// "children":null,
// "goods":null
// "id:"1191110022
// "name":"T恤"
// "picture":"https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/qznz_tx.png?quality=95&imageView",
// "children":null,
// "goods":null
// "id:"1191110023"
// "name:"针织衫"
// "picture":"https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/qznz_zzs.png?quality=95&imageView",
// "children":null,
// "goods":null
// "id:"1191110024"
// "name":"夹克
// "picture":"https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/qznz_jk.png?quality=95&imageView",
// "children":null,
// 'goods":null

//分类列表
class CategoryItem {
  String id;
  String name;
  String picture;
  List<CategoryItem>? children;
  CategoryItem({
    required this.id,
    required this.name,
    required this.picture,
    this.children,
  });
  // 工厂方法  扩展工厂函数  一般用factory来声明 它一般用来创建对象
  factory CategoryItem.fromJSON(Map<String, dynamic> json) {
    // 创建对象  必须是CategoryItem对象
    return CategoryItem(
      id: json['id'],
      name: json['name'],
      picture: json['picture'],
      children: json['children'] == null
          ? []
          : (json['children'] as List)
                .map((item) => CategoryItem.fromJSON(item))
                .toList(),
    );
  }
}
