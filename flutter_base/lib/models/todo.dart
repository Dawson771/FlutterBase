// models：纯数据，无 UI
// 数据模型：定义“任务”的本质
// title：任务内容（字符串）
// isDone：完成状态（布尔值，默认未完成）
//  🔑 注意：这里使用 可变字段（非 final），是为了在简单示例中直接修改状态。在大型项目中，建议使用不可变对象 + 状态管理库（如 Provider）。

// 定义待办任务的核心数据结构，包含任务标题和完成状态，同时新增序列化 / 反序列化方法，用于数据持久化（将对象转为字符串存储，从字符串恢复为对象）。

/// 待办任务数据模型
/// 纯数据类，无任何UI和业务逻辑
class Todo {
  // 任务标题
  String title;
  // 完成状态，默认未完成
  bool isDone;

  // 构造方法，title为必传参数，isDone有默认值
  Todo({
    required this.title,
    this.isDone = false,
  });

  /// 序列化方法：将Todo对象转为Map，方便后续转为JSON存储
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'isDone': isDone,
    };
  }

  /// 反序列化方法：从Map中解析出Todo对象，用于从本地存储恢复数据
  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      title: map['title'] as String,
      isDone: map['isDone'] as bool,
    );
  }
}