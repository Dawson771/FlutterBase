import 'package:hm_shop/constants/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenManager {
  //返回持久化对象的实例对象
  Future<SharedPreferences> _getInstance() {
    return SharedPreferences.getInstance();
  }

  String _token = "";
  // 初始化token
  Future<void> init() async {
    final prefs = await _getInstance();
    _token = prefs.getString(GlobalConstants.TOKEN_KET) ?? "";
  }

  /// 设置 token
  /// 将 token 保存到 SharedPreferences（磁盘持久化）并更新内存缓存
  /// 参数说明: [val]: 要保存的 token 字符串
  /// 特性:
  /// 1. 双写机制：同时写入磁盘和内存
  /// 2. 异步操作：确保数据完全写入后再返回
  /// 3. 原子性：使用 await 保证写入顺序
  Future<void> setToken(String val) async {
    // 获取持久化对象实例
    final prefs = await _getInstance();
    // 保存到磁盘（必须 await，确保写入完成）
    await prefs.setString(GlobalConstants.TOKEN_KET, val);
    // 更新内存缓存
    _token = val;
    print(
      "✅ TokenManager token已保存 - 内存：$_token, 磁盘键名：${GlobalConstants.TOKEN_KET}",
    );
  }

  // 获取token
  String getToken() {
    return _token;
  }

  /// 删除 token
  ///
  /// 从 SharedPreferences（磁盘）和内存缓存中清除 token
  /// 用于退出登录场景
  ///
  /// 特性:
  /// 1. 双清机制：同时清除磁盘和内存数据
  /// 2. 异步操作：确保完全删除后再返回
  Future<void> removeToken() async {
    final prefs = await _getInstance();

    // 从磁盘删除（必须 await，确保删除完成）
    await prefs.remove(GlobalConstants.TOKEN_KET);

    // 清空内存缓存
    _token = "";

    print("✅ Token 已删除 - 内存：$_token, 磁盘键名：${GlobalConstants.TOKEN_KET}");
  }
}

final tokenManager = TokenManager();
