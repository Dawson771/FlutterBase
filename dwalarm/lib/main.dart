import 'package:dwalarm/App.dart';
import 'package:dwalarm/common/data/paths.dart';
import 'package:dwalarm/system/data/app_info.dart';
import 'package:dwalarm/system/data/device_info.dart';
import 'package:flutter/material.dart';
import 'package:timezone/data/latest_all.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeTimeZones(); //初始化时区数据，用于处理不同时区的闹钟和定时器

  final initializeData = [
    initializePackageInfo(), // 初始化应用包信息
    initializeAndroidInfo(), // 初始化 Android 设备信息
    initializeAppDataDirectory(), // 初始化应用数据目录
    // initializeNotifications(), // 初始化通知系统
    // AndroidAlarmManager.initialize(), // 初始化 Android 闹钟管理器
    // BootReceiver.initialize(handleBoot), // 初始化开机启动接收器
    // RingtonePlayer.initialize(), // 初始化铃声播放器
    // initializeAudioSession(), // 初始化音频会话
    // FlutterShowWhenLocked().hide(), // 初始化锁屏显示控制
  ];
  await Future.wait(initializeData); //使用 Future.wait 并行初始化多个独立组件，提高启动速度

  runApp(const App());
}

