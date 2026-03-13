// widgets：无状态或受控组件，专注渲染

// 待办列表组件：lib/widgets/todo_list.dart
// 封装 ListView.builder 实现待办列表的高效渲染，接收待办列表数据和回调，分发给每个 TodoItem，实现列表懒加载（仅渲染当前屏幕可见的列表项，优化性能）。

import 'package:flutter/material.dart';
import 'package:flutter_base/models/todo.dart';
import 'package:flutter_base/widgets/todo_item.dart';
// import 'package:todo_app/models/todo.dart';
// import 'package:todo_app/widgets/todo_item.dart';

/// 待办列表组件
/// 无状态组件，仅负责列表渲染，不处理业务逻辑
class TodoList extends StatelessWidget {
  // 待办列表数据
  final List<Todo> todos;
  // 切换单个任务完成状态的回调（接收索引，定位具体任务）
  final Function(int) toggleStatus;
  // 删除单个任务的回调（接收索引，定位具体任务）
  final Function(int) onDelete;

  // 构造方法，所有参数为必传
  const TodoList({
    super.key,
    required this.todos,
    required this.toggleStatus,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    // 空状态判断：如果待办列表为空，显示友好的空状态提示
    if (todos.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle_outline,
              size: 60,
              color: Colors.grey,
            ),
            SizedBox(height: 20),
            Text(
              '暂无待办事项，添加一些新任务开始吧！',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    // 列表渲染：ListView.builder 实现懒加载，适合动态列表
    return ListView.builder(
      // 列表项数量 = 待办列表长度
      itemCount: todos.length,
      // 列表项构建器：根据索引生成每个TodoItem
      itemBuilder: (context, index) {
        final todo = todos[index];
        return TodoItem(
          todo: todo,
          // 切换状态回调：调用父组件的toggleStatus，传入当前索引
          toggleStatus: () => toggleStatus(index),
          // 删除回调：调用父组件的onDelete，传入当前索引
          onDismissed: () => onDelete(index),
        );
      },
      // 列表项之间的间距
      itemExtent: 60,
      padding: const EdgeInsets.symmetric(vertical: 10),
    );
  }
}