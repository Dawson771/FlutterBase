// widgets：无状态或受控组件，专注渲染
// 待办单项组件：lib/widgets/todo_item.dart
// 封装单个待办任务的 UI 展示，包含任务标题、完成状态复选框，同时集成 Dismissible 实现左滑删除功能，添加滑动背景视觉反馈，符合移动端用户交互习惯。

import 'package:flutter/material.dart';
import 'package:flutter_base/models/todo.dart';
// import 'package:flutterbase/models/todo.dart';

/// 待办单项组件
/// 无状态组件，仅负责渲染，通过构造函数接收数据和回调
class TodoItem extends StatelessWidget {
  // 待办任务数据
  final Todo todo;
  // 切换完成状态的回调
  final VoidCallback toggleStatus;
  // 滑动删除的回调
  final VoidCallback onDismissed;

  // 构造方法，所有参数为必传
  const TodoItem({
    super.key,
    required this.todo,
    required this.toggleStatus,
    required this.onDismissed,
  });

  @override
  Widget build(BuildContext context) {
    // 滑动删除组件：包裹ListTile，实现左滑删除功能
    return Dismissible(
      // 唯一标识：使用任务标题（确保唯一，避免列表更新时状态混乱）
      key: Key(todo.title),
      // 滑动方向：仅允许水平左滑
      direction: DismissDirection.startToEnd,
      // 滑动时的背景：红色背景+删除图标，提升交互体验
      background: Container(
        color: Colors.redAccent,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      // 滑动完成后的回调：调用父组件传递的删除方法
      onDismissed: (direction) => onDismissed(),
      // 待办单项核心UI：ListTile（Flutter官方列表项组件，适配Material设计）
      child: ListTile(
        // 任务标题：已完成则添加删除线并置灰，未完成则正常显示
        title: Text(
          todo.title,
          style: TextStyle(
            fontSize: 16,
            color: todo.isDone ? Colors.grey : Colors.black87,
            decoration: todo.isDone ? TextDecoration.lineThrough : TextDecoration.none,
            decorationColor: Colors.grey,
            decorationThickness: 2,
          ),
        ),
        // 右侧复选框：绑定完成状态，点击触发状态切换回调
        trailing: Checkbox(
          // 复选框选中状态 = 任务完成状态
          value: todo.isDone,
          // 复选框点击事件：触发父组件的状态切换方法
          onChanged: (value) => toggleStatus(),
          // 复选框激活颜色
          activeColor: Colors.blueAccent,
        ),
      ),
    );
  }
}