// screens：页面容器，持有状态

// 主页面：HomeScreen
// HomeScreen 是整个应用的“大脑”：

// 持有 _todos 列表（状态）
// 提供 _addTodo 和 _toggleTodoStatus 方法（状态变更）
// 渲染 TodoList 并传递回调函数

// 页面级组件层：lib/screens/home_screen.dart
// 应用主页面，作为状态中心，持有待办列表核心状态，处理添加任务、切换完成状态、删除任务、数据持久化等所有业务逻辑，协调子组件 TodoList 的交互。

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_base/models/todo.dart';
import 'package:flutter_base/widgets/todo_list.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:todo_app/models/todo.dart';
// import 'package:todo_app/widgets/todo_list.dart';

/// 应用主页面
/// 有状态组件，持有页面核心状态，处理所有业务逻辑
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // 待办列表核心状态：私有变量，仅在当前类中修改
  late List<Todo> _todos;

  @override
  void initState() {
    super.initState();
    // 页面初始化时，从本地存储加载待办数据
    _loadTodosFromLocal();
  }

  /// 从本地存储加载待办数据
  Future<void> _loadTodosFromLocal() async {
    // 获取SharedPreferences实例
    final prefs = await SharedPreferences.getInstance();
    // 从本地取出存储的待办列表（字符串格式）
    final String? todosString = prefs.getString('todos');
    if (todosString != null && todosString.isNotEmpty) {
      // 将字符串转为List<Map>，再反序列化为List<Todo>
      final List<dynamic> todosMap = List<dynamic>.from(jsonDecode(todosString));
      setState(() {
        _todos = todosMap.map((e) => Todo.fromMap(e as Map<String, dynamic>)).toList();
      });
    } else {
      // 本地无数据时，初始化空列表
      setState(() {
        _todos = [];
      });
    }
  }

  /// 将待办数据保存到本地存储
  Future<void> _saveTodosToLocal() async {
    // 将List<Todo>序列化为List<Map>，再转为JSON字符串
    final List<Map<String, dynamic>> todosMap = _todos.map((e) => e.toMap()).toList();
    final String todosString = jsonEncode(todosMap);
    // 获取SharedPreferences实例，将字符串存入本地，key为todos
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('todos', todosString);
  }

  /// 添加新任务
  void _addTodo(String title) {
    // 空值校验：任务标题不为空才添加
    if (title.trim().isEmpty) return;
    setState(() {
      // 向待办列表添加新任务
      _todos.add(Todo(title: title.trim()));
    });
    // 添加后立即保存到本地
    _saveTodosToLocal();
  }

  /// 切换任务完成状态
  void _toggleTodoStatus(int index) {
    setState(() {
      // 根据索引修改任务的完成状态
      _todos[index].isDone = !_todos[index].isDone;
    });
    // 状态修改后立即保存到本地
    _saveTodosToLocal();
  }

  /// 删除任务
  void _deleteTodo(int index) {
    setState(() {
      // 根据索引删除任务
      _todos.removeAt(index);
    });
    // 删除后立即保存到本地
    _saveTodosToLocal();
    // 显示删除成功的提示（SnackBar），提升用户体验
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('任务已删除'),
          duration: Duration(seconds: 1),
          backgroundColor: Colors.greenAccent,
        ),
      );
    }
  }

  /// 打开添加任务的对话框
void _showAddTodoDialog() {
  // 文本编辑控制器：用于获取对话框中的输入内容
  final TextEditingController controller = TextEditingController();
  // 显示对话框
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      // 对话框标题
      title: const Text('添加新待办'),
      // 对话框内容：文本输入框（修复核心位置）
      content: TextField(
        controller: controller,
        // 自动聚焦：打开对话框后直接弹出键盘，提升输入效率
        autofocus: true,
        // 回车键触发添加
        onSubmitted: (value) => _addTodo(value),
        // 所有提示文本、边框等样式都要放在 InputDecoration 中
        decoration: const InputDecoration(
          hintText: '请输入任务内容', // ✅ 正确位置：放在 InputDecoration 内部
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        ),
      ),
      // 对话框操作按钮
      actions: [
        // 取消按钮：关闭对话框
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('取消'),
        ),
        // 添加按钮：关闭对话框并添加任务
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            _addTodo(controller.text);
          },
          child: const Text('添加'),
        ),
      ],
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 页面标题栏
      appBar: AppBar(
        title: const Text('待办事项'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      // 页面主体：待办列表组件
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: TodoList(
          todos: _todos,
          toggleStatus: _toggleTodoStatus,
          onDelete: _deleteTodo,
        ),
      ),
      // 右下角悬浮按钮：触发添加任务对话框
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTodoDialog,
        child: const Icon(Icons.add),
        backgroundColor: Colors.blueAccent,
        elevation: 5,
      ),
    );
  }
}