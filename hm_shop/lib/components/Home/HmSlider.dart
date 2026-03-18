import 'package:flutter/material.dart';

class HmSlider extends StatefulWidget {
  HmSlider({Key? key}) : super(key: key);

  @override
  _HmSliderState createState() => _HmSliderState();
}

class _HmSliderState extends State<HmSlider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 249,
      color: Colors.blue,
      // width: MediaQuery.of(context).size.width,       //获取屏幕宽度
      alignment: Alignment.center,
      child: Text("轮播图", style: TextStyle(fontSize: 20, color: Colors.red)),
    );
  }
}
