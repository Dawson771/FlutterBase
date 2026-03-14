import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MainPage());
    
}
class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() {
    print("createState阶段");
    return _MainPageState();
  } 
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() { 
    super.initState();
    print("initState初始化");
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies依赖改变");
  }
  @override
  void didUpdateWidget(covariant MainPage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget组件更新");
  }
  @override
  void deactivate() {
    // TODO: implement deactivate
    print("deactivate组件被移除");
    super.deactivate();
  }
  @override
  void dispose() { 
    print("dispose销毁");
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    print("build构建");
    return Container(
       child: null,
    );
  }
}
// class MainPage extends StatelessWidget {
//   const MainPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     print("build构建");
//     return MaterialApp(
//       title: "flutter app",
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("app bar"),
//           centerTitle: true,
//         ),
//         body: Center(
//           child: Text("中部区无状态组件"),
//         ),
//       ),

//     );
//   }
// }
// // 有状态组件 --自定义组件中一种  有交互的组件  对外
// class MainPage extends StatefulWidget{
//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     return _MainPageState();
//   }

// }
// //对内  第二个类内部类负责管理数据处理业务逻辑并且渲染视图
// class _MainPageState extends State<MainPage>{
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//         return MaterialApp(
//           title: "flutter 有状态组件",
//           home: Scaffold(
//             appBar: AppBar(
//               centerTitle: true,
//               title: Text("app bar"),
//             ),
//             body: Center(
//               child: Text("中部区无状态组件"),
//             ),
//             bottomNavigationBar: Container(
//               height: 80,
//               child: Center(
//                 child: Text("bottomNavigationBar"),
//               ),
//             ),  
//           ));
//   }

// }
// // 无状态组件 --自定义组件中的一种  无交互的组件
// class mainApp extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return MaterialApp(
//       title: "flutter 无状态组件",
//       home: Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           title: Text("app bar"),
//         ),
//         body: Center(
//           child: Text("中部区无状态组件"),
//         ),
//         bottomNavigationBar: Container(
//           height: 80,
//           child: Center(
//             child: Text("bottomNavigationBar"),
//           ),
//         ),  
//       ));
//   }

// }