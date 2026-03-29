//封装api  目的是返回业务侧要的数据

import 'package:hm_shop/constants/index.dart';
import 'package:hm_shop/utils/DioRequest.dart';
import 'package:hm_shop/viewmodels/home.dart';

Future<List<BannerItem>> getBannerListAPI() async {
  //返回请求
  return ((await dioRequest.get(HttpConstants.BANNER_LIST)) as List).map((
    item,
  ) {
    return BannerItem.fromJson(item as Map<String, dynamic>);
  }).toList();
}

//分类列表
Future<List<CategoryItem>> getCategoryListAPI() async {
  //返回请求
  return ((await dioRequest.get(HttpConstants.CATEGORY_LIST)) as List).map((
    item,
  ) {
    return CategoryItem.fromJson(item as Map<String, dynamic>);
  }).toList();
}

//特惠推荐
Future<PreferenceResult> getSuggestionListAPI() async {
  return PreferenceResult.fromJson(
    await dioRequest.get(HttpConstants.PRODUCT_LIST),
  );
}

// 热榜推荐
Future<PreferenceResult> getInVogueListAPI() async {
  final responseData = await dioRequest.get(HttpConstants.IN_VOGUE_LIST);
  final ret = PreferenceResult.fromJson(responseData);
  return ret;
}

// 一站式推荐
Future<PreferenceResult> getOneStopListAPI() async {
  final responseData = await dioRequest.get(HttpConstants.ONE_STOP_LIST);
  final ret = PreferenceResult.fromJson(responseData );
  return ret;
}

// 推荐列表
Future<List<GoodDetailItem>> getRecommendListAPI(
  Map<String, dynamic> params,
) async {
  // final responseData = await dioRequest.get(
  //   HttpConstants.RECOMMEND_LIST,
  //   params: params,
  // );
  // final ret = (responseData as List)
  //     .map((item) => GoodDetailItem.fromJson(item))
  //     .toList();
  // // return ret;
  return ((await dioRequest.get(HttpConstants.RECOMMEND_LIST, params: params))
          as List)
      .map((item) {
        return GoodDetailItem.fromJson(item as Map<String, dynamic>);
      })
      .toList();
}
