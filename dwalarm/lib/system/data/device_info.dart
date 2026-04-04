// 导入 device_info_plus 包，用于获取设备详细信息
import 'package:device_info_plus/device_info_plus.dart';

// 全局变量，存储 Android 设备信息，可为空
AndroidDeviceInfo? androidInfo;

/// 初始化 Android 设备信息
/// 
/// 该函数在应用启动时调用，获取当前 Android 设备的详细信息
/// 包括设备型号、系统版本、品牌等数据
Future<void> initializeAndroidInfo() async {
  // 创建设备信息插件实例
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  // 异步获取 Android 设备信息并存储到全局变量
  androidInfo = await deviceInfo.androidInfo;
}