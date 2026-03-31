import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hm_shop/api/user.dart';
import 'package:hm_shop/stores/UserController.dart';
import 'package:hm_shop/utils/LoadingDialog.dart';
import 'package:hm_shop/utils/ToastUtils.dart';
import 'package:hm_shop/utils/TokenManager.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  final UserController _userController = Get.find();

  // 构建手机号输入框
  Widget _buildPhoneTextField() {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "请输入手机号";
        }
        if (!RegExp(r"^1[3-9]\d{9}$").hasMatch(value)) {
          return "请输入正确的手机号";
          // 13200000001 13200000010
          // pwd 123456
        }
        return null;
      },
      controller: _phoneController,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 20),
        hintText: "请输入手机号",
        fillColor: const Color.fromRGBO(243, 243, 243, 1),
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }

  // 构建验证码输入框
  Widget _buildCodeTextField() {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "请输入验证码";
        }
        if (!RegExp(r"^[a-zA-Z0-9_]{6,16}$").hasMatch(value)) {
          return "请输入6-16位的字母数字或者下划线";
        }
        return null;
      },
      controller: _codeController,
      obscureText: true,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 20),
        hintText: "请输入验证码",
        fillColor: const Color.fromRGBO(243, 243, 243, 1),
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }

  /// 登录验证和 API 调用
  ///
  /// 执行表单验证，调用登录接口并处理结果
  /// 成功则更新用户信息、保存 token 并返回上一页
  /// 失败则显示错误提示
  _login() async {
    try {
      print("🔐 [LoginPage] 开始登录流程...");
      Loadingdialog.show(context, message: "登录中...");
      print("📞 [LoginPage] 账号：${_phoneController.text}");

      // 调用登录 API
      final res = await loginAPI({
        "account": _phoneController.text, // 账号（手机号）
        "password": _codeController.text, // 密码（验证码）
      });
      print("📦 [LoginPage] 登录 API 调用成功:返回的用户信息：${res.toString()}");
      print("🔑 [LoginPage] Token 值：${res.token}");
      // 1. 更新用户信息到全局状态（内存）
      _userController.updataUserInfo(res);
      print("✅ [LoginPage] 用户信息已更新到内存");

      // 2. 保存 token 到持久化存储（磁盘）
      if (res.token.isNotEmpty) {
        print("💾 [LoginPage] 准备保存 token 到 SharedPreferences...");
        await tokenManager.setToken(res.token);
        print(
          "✅ [LoginPage] Token 已保存到磁盘，内存中的 token: ${tokenManager.getToken()}",
        );
      } else {
        print("⚠️ [LoginPage] 警告：登录响应中 token 为空，无法保存");
      }

      // 3. 显示成功提示
      if (mounted) {
        print("🎉 [LoginPage] 登录成功，准备返回上一页");
        Loadingdialog.hide(context);
        ToastUtils.showToast(context, "登录成功");
        // 4. 返回上一页
        Navigator.pop(context);
      }
    } catch (e) {
      Loadingdialog.hide(context);
      // 错误处理：显示友好的错误消息
      String errorMessage;

      if (e is DioException) {
        // Dio 异常：提取错误消息，如果为空则使用默认提示
        errorMessage = e.message ?? "登录失败，请稍后重试";

        // 根据状态码提供更具体的提示
        if (e.response?.statusCode == 400) {
          errorMessage = "账号或密码错误";
        } else if (e.response?.statusCode == 401) {
          errorMessage = "未授权，请检查账号和密码";
        } else if (e.response?.statusCode == 403) {
          errorMessage = "访问被拒绝";
        } else if (e.response?.statusCode == 404) {
          errorMessage = "请求的资源不存在";
        } else if (e.response?.statusCode == 500) {
          errorMessage = "服务器错误，请稍后重试";
        } else if (e.response?.statusCode == 502) {
          errorMessage = "网关错误，请稍后重试";
        } else if (e.response?.statusCode == 503) {
          errorMessage = "服务暂时不可用";
        } else if (e.type == DioExceptionType.connectionTimeout) {
          errorMessage = "网络连接超时，请检查网络设置";
        } else if (e.type == DioExceptionType.receiveTimeout) {
          errorMessage = "响应超时，请稍后重试";
        } else if (e.type == DioExceptionType.sendTimeout) {
          errorMessage = "发送请求超时，请稍后重试";
        } else if (e.type == DioExceptionType.badCertificate) {
          errorMessage = "证书错误，请检查网络安全设置";
        } else if (e.type == DioExceptionType.connectionError) {
          errorMessage = "网络连接错误，请检查网络设置";
        } else if (e.type == DioExceptionType.cancel) {
          errorMessage = "请求已取消";
        }
      } else if (e is Exception) {
        // 其他异常
        errorMessage = "发生错误：${e.toString()}";
      } else {
        // 未知错误
        errorMessage = "未知错误，请稍后重试";
      }

      if (mounted) {
        ToastUtils.showToast(context, errorMessage);
      }
    }
  }

  // 登录按钮
  bool _isChecked = false;
  Widget _buildLoginButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          if (_key.currentState?.validate() ?? false) {
            if (_isChecked) {
              _login();
            } else {
              ToastUtils.showToast(context, "请勾选用户协议");
            }
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: const Text(
          "登录",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }

  // 勾选用户协议
  Widget _buildCheckbox() {
    return Row(
      children: [
        Checkbox(
          value: _isChecked,
          activeColor: Colors.black,
          checkColor: Colors.white,
          onChanged: (bool? value) {
            setState(() {
              _isChecked = value ?? false;
            });
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          side: const BorderSide(color: Colors.grey, width: 2.0),
        ),

        const Text.rich(
          TextSpan(
            children: [
              TextSpan(text: "我已阅读并同意"),
              TextSpan(
                text: "《用户协议》",
                style: TextStyle(color: Colors.blue),
              ),
              TextSpan(text: "和"),
              TextSpan(
                text: "《隐私政策》",
                style: TextStyle(color: Colors.blue),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // 头部
  Widget _buildHeader() {
    return const Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            "账号密码登录",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  final GlobalKey<FormState> _key = GlobalKey<FormState>(); // 表单

  // 构建页面
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("登录", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
      ),
      body: Form(
        key: _key,
        child: Container(
          child: Column(
            children: [
              const SizedBox(height: 20),
              _buildHeader(),
              const SizedBox(height: 30),
              _buildPhoneTextField(),
              const SizedBox(height: 20),
              _buildCodeTextField(),
              const SizedBox(height: 30),
              _buildLoginButton(),
              const SizedBox(height: 20),
              _buildCheckbox(),
            ],
          ),
        ),
      ),
    );
  }
}
