import 'package:flutter/material.dart';

class HmMoreList extends StatefulWidget {
  HmMoreList({Key? key}) : super(key: key);

  @override
  _HmMoreListState createState() => _HmMoreListState();
}

class _HmMoreListState extends State<HmMoreList> {
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate:
          // 设置列数 网格为2列
          SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),

      itemBuilder: (BuildContext context, int index) {
        return Container(
          child: Text(
            '更多列表',
            style: TextStyle(fontSize: 20, color: Colors.red),
          ),
          color: Colors.blue,
          alignment: Alignment.center,
        );
      },
    );
  }
}
