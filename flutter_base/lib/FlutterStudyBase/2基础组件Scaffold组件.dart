import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    title: "flutter app",
    // theme: ThemeData(scaffoldBackgroundColor: Colors.green),
    home: Scaffold(
      appBar: AppBar(
        title: Text("app bar头部区域"),
        centerTitle: true,
      ),  
      body:Container(
        child:Center(
          child: Text("body中部区域"),
        )     
      ),
      bottomNavigationBar: Container(
        height: 80,
        child:Center(
          child:Text("bottomNavigationBar底部区域"),
        )
      ),
    )));
}