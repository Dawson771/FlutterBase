class BannerItem {
  String id;
  String imgUrl;
  BannerItem({required this.id, required this.imgUrl});
  // 工厂方法  扩展 工厂函数  一般用factory来声明 它一般用来创建对象
  factory BannerItem.fromJSON(Map<String, dynamic> json) {
    // 返回对象  必须是BannerItem 对象
    return BannerItem(id: json['id'], imgUrl: json['imgUrl']);
  }
}


// /Map<string,dynamic>
//每一个轮播图具体类型
//flutter必须强制转化没有隐私转化