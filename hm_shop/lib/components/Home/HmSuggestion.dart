import 'package:flutter/material.dart';

class HmSuggestion extends StatefulWidget {
  HmSuggestion({Key? key}) : super(key: key);

  @override
  _HmSuggestionState createState() => _HmSuggestionState();
}

class _HmSuggestionState extends State<HmSuggestion> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 249,
        color: Colors.blue,
        // width: MediaQuery.of(context).size.width,       //获取屏幕宽度
        alignment: Alignment.center,
        child: Text("推荐", style: TextStyle(fontSize: 20, color: Colors.red)),
      ),
    );
  }
}
