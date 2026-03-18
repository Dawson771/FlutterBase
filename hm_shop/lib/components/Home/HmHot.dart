import 'package:flutter/material.dart';

class HmHot extends StatefulWidget {
  HmHot({Key? key}) : super(key: key);

  @override
  _HmHotState createState() => _HmHotState();
}

class _HmHotState extends State<HmHot> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      height: 100,
      //获取屏幕宽度MediaQuery.of(context).size.width
      // width: (MediaQuery.of(context).size.width - 10) / 2,
      alignment: Alignment.center,
      child: Text("轮播图", style: TextStyle(fontSize: 20, color: Colors.red)),
    );
  }
}
