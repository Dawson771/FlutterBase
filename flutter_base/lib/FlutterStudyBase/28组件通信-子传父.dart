import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MainPage());
}

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<String> _list = ["鱼香肉丝", "宫保鸡丁", "烤牛", "粉蒸肉", "豆角"];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(10),
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
          children: List.generate(_list.length, (index) {
            return Child(
              foodName: _list[index],
              index: index,
              deleteFood: (int i) {
                print("1111点击了删除${i}按钮");
                print(_list);
                _list.removeAt(i); //删除索引
                print(_list);
                setState(() {});
              },
            );
          }),
        ),
      ),
    );
  }
}

class Child extends StatefulWidget {
  final String foodName;
  final int index;
  final Function(int index) deleteFood;
  Child({
    Key? key,
    required this.foodName,
    required this.index,
    required this.deleteFood,
  }) : super(key: key);

  @override
  _ChildState createState() => _ChildState();
}

class _ChildState extends State<Child> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          alignment: Alignment.center,
          color: Colors.blue,
          child: Text(
            widget.foodName,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        IconButton(
          color: Colors.red,
          onPressed: () {
            print("点击了删除${widget.index}按钮");
            widget.deleteFood(widget.index);
          },
          icon: Icon(Icons.delete),
        ),
      ],
    );
  }
}

// class MainPage extends StatelessWidget {
//   const MainPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text("父传子")),
//         body: Container(
//           alignment: Alignment.center,
//           child: Column(
//             children: [
//               Text("父组件", style: TextStyle(fontSize: 20, color: Colors.blue)),
//               Child(message: "我是父组件传递的参数"), //3 创建子组件,并传参数
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// // //无状态组件子组件
// // class Child extends StatelessWidget {
// //   final String? message; //1 定义属性//子组件接收父组件传递的参数
// //   const Child({Key? key, this.message}) : super(key: key); //2 构造方法中接收message参数

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       alignment: Alignment.center,
// //       child: Column(
// //         children: [
// //           Text(
// //             "子组件$message",
// //             style: TextStyle(fontSize: 18, color: Colors.red),
// //           ),

// //         ],
// //       ),
// //     );
// //   }
// // }

// //有状态组件子组件
// class Child extends StatefulWidget {
//   final String message;
//   Child({Key? key, required this.message}) : super(key: key);

//   @override
//   _ChildState createState() => _ChildState();
// }

// class _ChildState extends State<Child> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Text(
//         "子组件${widget.message}",
//         style: TextStyle(fontSize: 18, color: Colors.red),
//       ),
//     );
//   }
// }
