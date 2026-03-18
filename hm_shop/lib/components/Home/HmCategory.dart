import 'package:flutter/material.dart';

class HmCategory extends StatefulWidget {
  HmCategory({Key? key}) : super(key: key);

  @override
  _HmCategoryState createState() => _HmCategoryState();
}

class _HmCategoryState extends State<HmCategory> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal, //横向滚动
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: 100,
            height: 100,
            margin: EdgeInsets.symmetric(horizontal: 5),
            color: Colors.blue,
            alignment: Alignment.center,
            child: Text(
              '分类$index',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}
