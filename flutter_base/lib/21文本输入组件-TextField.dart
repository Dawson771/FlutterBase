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
  TextEditingController _phoneController = TextEditingController(); //创建账号控制器
  TextEditingController _pwdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("登录")),
        body: Container(
          padding: EdgeInsets.all(20),
          color: Colors.white,
          child: Column(
            children: [
              TextField(
                onChanged: (value) {
                  print("账号输入：$value");
                },
                controller: _phoneController,
                decoration: InputDecoration(
                  hintText: "请输入用户名",
                  fillColor: Colors.amber,
                  filled: true,
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _pwdController,
                obscureText: true, //不显示实际内容
                decoration: InputDecoration(
                  hintText: "请输入密码",
                  fillColor: Colors.amber,
                  filled: true,
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.black,
                ),
                child: TextButton(
                  onPressed: () {
                    print(
                      "登录-${_phoneController.text} - ${_pwdController.text}",
                    );
                  },
                  child: Text("登录", style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
