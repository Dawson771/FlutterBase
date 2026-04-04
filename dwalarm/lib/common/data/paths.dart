// 导入 dart:io 库，用于文件和目录操作
import 'dart:io';

// 导入 path_provider 包，用于获取系统目录路径
import 'package:path_provider/path_provider.dart';
// 导入 path 包，用于跨平台路径拼接和处理
import 'package:path/path.dart' as path;

// 应用数据主目录名称
const _appDataDirectory = "Clock";
// 铃声资源子目录名称
const _ringtonesDirectory = "ringtones";
// 全局变量，存储应用数据目录的完整路径
String _appDataDirectoryPath = "";

/// 初始化应用数据目录
/// 
/// 在应用启动时调用，确保必要的目录结构存在
/// 创建主应用数据目录和铃声音频目录
Future<void> initializeAppDataDirectory() async {
  // 获取并缓存应用数据目录路径
  _appDataDirectoryPath = await getAppDataDirectoryPath();

  // 如果主目录不存在，则创建
  if (!await Directory(_appDataDirectoryPath).exists()) {
    await Directory(_appDataDirectoryPath).create();
  }

  // 创建铃声目录（递归创建，确保父目录存在）
  await Directory(getRingtonesDirectoryPathSync()).create(recursive: true);
}

/// 同步获取应用数据目录路径
/// 
/// 返回已缓存的目录路径，如果未初始化则抛出异常
String getAppDataDirectoryPathSync() {
  if (_appDataDirectoryPath.isEmpty) {
    throw Exception(
        "App data directory path is not initialized. Call 'initializeAppDataDirectory()' first.");
  }
  return _appDataDirectoryPath;
}

/// 异步获取应用数据目录路径
/// 
/// 返回应用文档目录下的 "Clock" 文件夹路径
Future<String> getAppDataDirectoryPath() async {
  return path.join(
      (await getApplicationDocumentsDirectory()).path, _appDataDirectory);
}

/// 异步获取铃声目录路径
Future<String> getRingtonesDirectoryPath() async {
  return path.join(await getAppDataDirectoryPath(), _ringtonesDirectory);
}

/// 同步获取铃声目录路径
String getRingtonesDirectoryPathSync() {
  return path.join(getAppDataDirectoryPathSync(), _ringtonesDirectory);
}

/// 获取时区数据库文件路径
Future<String> getTimezonesDatabasePath() async {
  return path.join(await getAppDataDirectoryPath(), 'timezones.db');
}

/// 获取日志文件路径
Future<String> getLogsFilePath() async {
  return path.join(await getAppDataDirectoryPath(), "logs.txt");
}

/// 同步获取日志文件路径
String getLogsFilePathSync(){
  return path.join(getAppDataDirectoryPathSync(), "logs.txt");
}