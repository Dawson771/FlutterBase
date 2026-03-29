class BannerItem {
  String id;
  String imgUrl;
  BannerItem({required this.id, required this.imgUrl});
  // 工厂方法  扩展 工厂函数  一般用factory来声明 它一般用来创建对象
  factory BannerItem.fromJson(Map<String, dynamic> json) {
    // 返回对象  必须是BannerItem 对象
    return BannerItem(id: json['id'], imgUrl: json['imgUrl']);
  }
}

// /Map<string,dynamic>
//每一个轮播图具体类型
//flutter必须强制转化没有隐私转化

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
  factory CategoryItem.fromJson(Map<String, dynamic> json) {
    // 创建对象  必须是CategoryItem对象
    return CategoryItem(
      id: json['id'],
      name: json['name'],
      picture: json['picture'],
      children: json['children'] == null
          ? []
          : (json['children'] as List)
                .map((item) => CategoryItem.fromJson(item))
                .toList(),
    );
  }
}

// 特惠推荐 - 商品项
class GoodsItem {
  String id;
  String name;
  String? desc;
  String price;
  String picture;
  int orderNum;

  GoodsItem({
    required this.id,
    required this.name,
    this.desc,
    required this.price,
    required this.picture,
    required this.orderNum,
  });

  factory GoodsItem.fromJson(Map<String, dynamic> json) {
    return GoodsItem(
      id: json['id'],
      name: json['name'],
      desc: json['desc'],
      price: json['price'],
      picture: json['picture']?.toString().trim() ?? '',
      orderNum: json['orderNum'] ?? 0,
    );
  }
}

// 特惠推荐 - 商品列表
class GoodsItems {
  int counts;
  int pageSize;
  int pages;
  int page;
  List<GoodsItem> items;

  GoodsItems({
    required this.counts,
    required this.pageSize,
    required this.pages,
    required this.page,
    required this.items,
  });

  factory GoodsItems.fromJson(Map<String, dynamic> json) {
    return GoodsItems(
      counts: json['counts'] ?? 0,
      pageSize: json['pageSize'] ?? 0,
      pages: json['pages'] ?? 0,
      page: json['page'] ?? 0,
      items: json['items'] == null
          ? []
          : (json['items'] as List)
                .map((item) => GoodsItem.fromJson(item))
                .toList(),
    );
  }
}

// 特惠推荐 - 子类型
class SubType {
  String id;
  String title;
  GoodsItems goodsItems;

  SubType({required this.id, required this.title, required this.goodsItems});

  factory SubType.fromJson(Map<String, dynamic> json) {
    return SubType(
      id: json['id'],
      title: json['title'],
      goodsItems: GoodsItems.fromJson(json['goodsItems'] ?? {}),
    );
  }
}

class PreferenceResult {
  String id;
  String title;
  List<SubType> subTypes;

  PreferenceResult({
    required this.id,
    required this.title,
    required this.subTypes,
  });

  factory PreferenceResult.fromJson(Map<String, dynamic> json) {
    return PreferenceResult(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      subTypes: json['subTypes'] == null
          ? []
          : (json['subTypes'] as List)
                .map((item) => SubType.fromJson(item))
                .toList(),
    );
  }
}

/// 商品详情项
class GoodDetailItem extends GoodsItem {
  int payCount = 0;

  GoodDetailItem({
    required super.id,
    required super.name,
    required super.price,
    required super.picture,
    required super.orderNum,
    required this.payCount,
  }) : super(desc: "");

  // 转化方法
  factory GoodDetailItem.fromJson(Map<String, dynamic> json) {
    return GoodDetailItem(
      id: json["id"]?.toString() ?? "",
      name: json["name"]?.toString() ?? "",
      price: json["price"]?.toString() ?? "",
      picture: json["picture"]?.toString() ?? "",
      orderNum: int.tryParse(json["orderNum"]?.toString() ?? "0") ?? 0,
      payCount: int.tryParse(json["payCount"]?.toString() ?? "0") ?? 0,
    );
  }
}

class GoodsDetailsItems {
  int counts;
  int pageSize;
  int pages;
  int page;
  List<GoodDetailItem> items;

  GoodsDetailsItems({
    required this.counts,
    required this.pageSize,
    required this.pages,
    required this.page,
    required this.items,
  });

  factory GoodsDetailsItems.fromJson(Map<String, dynamic> json) {
    return GoodsDetailsItems(
      counts: json['counts'] ?? 0,
      pageSize: json['pageSize'] ?? 0,
      pages: json['pages'] ?? 0,
      page: json['page'] ?? 0,
      items: json['items'] == null
          ? []
          : (json['items'] as List)
                .map((item) => GoodDetailItem.fromJson(item))
                .toList(),
    );
  }
}
