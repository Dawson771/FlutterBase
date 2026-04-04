// 导入 awesome_notifications 包，用于本地通知功能
import 'package:awesome_notifications/awesome_notifications.dart';
// 导入通知渠道配置，定义不同类型的通知通道


/// 请求通知权限
/// 
/// 检查并请求发送通知的系统权限
/// [onAlreadyGranted] 当权限已授予时的回调函数
void requestNotificationPermissions({Function? onAlreadyGranted}) async {
  // 检查是否已允许发送通知
  AwesomeNotifications().isNotificationAllowed().then((allowed) {
    if (!allowed) {
      // 如果未授权，请求必要的通知权限
      AwesomeNotifications().requestPermissionToSendNotifications(
        permissions: [
          // NotificationPermission.Sound,  // 声音权限（已注释）
          NotificationPermission.Alert,  // 显示提醒的权限
          NotificationPermission.FullScreenIntent,  // 全屏意图权限（用于闹钟全屏显示）
        ],
      );
    } else {
      // 如果权限已授予，执行回调
      onAlreadyGranted?.call();
    }
  });
}

/// 初始化通知系统
/// 
/// 配置通知插件并创建所有通知渠道
Future<void> initializeNotifications() async {
  // 首先请求通知权限
  requestNotificationPermissions();
  
  // 初始化 AwesomeNotifications 插件
  await AwesomeNotifications().initialize(
    null, // 使用默认的应用图标
    [
      // 注册各种通知渠道
      // alarmNotificationChannel,      // 闹钟通知渠道
      // reminderNotificationChannel,   // 提醒事项通知渠道
      // stopwatchNotificationChannel,  // 秒表通知渠道
      // timerNotificationChannel,      // 倒计时通知渠道
      // foregroundNotificationChannel,  // 前台服务通知渠道（已注释）
    ],
    // channelGroups: [alarmNotificationChannelGroup],  // 通知渠道组（已注释）
    debug: false,  // 关闭调试模式
  );
}