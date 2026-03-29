import 'package:flutter/material.dart';

/// Toast 提示工具类
/// 
/// 用于在应用中显示短暂的提示信息（SnackBar）
/// 包含防重复显示机制，避免短时间内多次触发提示
class ToastUtils {
  /// 是否正在显示 Toast 的标志位
  /// 
  /// true: 当前有 Toast 正在显示，阻止新的 Toast 显示
  /// false: 可以显示新的 Toast
  /// 
  /// 作用：防止用户快速点击导致多个 Toast 重叠显示
  static bool showLoading = false;

  /// 显示 Toast 提示
  /// 
  /// 在页面底部显示一个浮动提示框，3 秒后自动消失
  /// 使用 SnackBar 实现，具有圆角样式和固定宽度
  /// 
  /// 参数说明:
  /// - [context]: BuildContext 上下文对象，用于获取 ScaffoldMessenger
  /// - [message]: 要显示的提示消息内容
  /// 
  /// 特性:
  /// 1. 防重复显示：如果已有 Toast 在显示，则忽略本次调用
  /// 2. 自动关闭：3 秒后自动隐藏并重置标志位
  /// 3. 浮动样式：使用 floating 行为，不占用底部空间
  /// 4. 圆角外观：10 像素圆角，视觉更柔和
  /// 5. 居中显示：文字内容居中对齐
  /// 
  /// 使用示例:
  /// ```dart
  /// ToastUtils.showToast(context, "操作成功");
  /// ToastUtils.showToast(context, "网络错误，请稍后重试");
  /// ```
  static void showToast(BuildContext context, String message) {
    // 如果已有 Toast 在显示，直接返回，防止重复
    if (ToastUtils.showLoading) {
      return;
    }
    
    // 标记为正在显示
    ToastUtils.showLoading = true;
    
    // 延迟 3 秒后重置标志位（与 SnackBar 显示时长一致）
    Future.delayed(const Duration(seconds: 3), () {
      ToastUtils.showLoading = false;
    });
    
    // 获取 ScaffoldMessenger 并显示 SnackBar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        width: 120, // 固定宽度 120 像素，使提示框更紧凑
        behavior: SnackBarBehavior.floating, // 浮动模式，不占用底部空间
        duration: const Duration(seconds: 3), // 显示时长 3 秒
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // 10 像素圆角边框
        ),
        content: Text(
          message, // 提示消息
          textAlign: TextAlign.center, // 文字居中对齐
        ),
      ),
    );
  }
}
