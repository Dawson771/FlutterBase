// 导入 package_info_plus 包，用于获取应用包信息
import 'package:package_info_plus/package_info_plus.dart';

// 全局变量：存储应用包信息实例
// 类型为 PackageInfo?，可为 null（初始化前）
PackageInfo? packageInfo;

/// 初始化应用包信息
/// 
/// 在应用启动时调用，从平台获取应用的包信息
/// 包括：应用名、包名、版本号、构建号等
Future<void> initializePackageInfo() async {
  // 异步获取平台的应用信息并赋值给全局变量
  packageInfo = await PackageInfo.fromPlatform();
}

/// 获取应用名称
/// 
/// 返回格式：
/// - 正式包：返回应用名（如 "DWAlarm"）
/// - 开发包：返回应用名 + " Dev"（如 "DWAlarm Dev"）
/// 
/// Returns: 应用名称字符串
String getAppName() {
  return '${packageInfo?.appName ?? 'DWAlarm'}${(packageInfo?.packageName.contains("dev") ?? false) ? " Dev" : ""}';
}