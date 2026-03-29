/// 用户相关 API 接口模块
/// 
/// 提供与用户相关的网络请求接口，包括登录、注册、个人信息等功能
/// 所有接口都通过 DioRequest 统一封装处理
library;

import 'package:hm_shop/constants/index.dart';
import 'package:hm_shop/utils/DioRequest.dart';
import 'package:hm_shop/viewmodels/user.dart';

/// 用户登录接口
/// 
/// 调用后端登录 API，验证用户身份并返回用户信息
/// 
/// 参数说明:
/// - [data]: 登录请求参数 Map，通常包含以下字段:
///   - `mobile`: 手机号码 (String)
///   - `code`: 验证码 (String)
///   - 或其他登录所需的凭证信息
/// 
/// 返回值:
/// - [Future<UserInfo>]: 异步返回 UserInfo 对象，包含完整的用户信息
///   - account: 账号
///   - avatar: 头像 URL
///   - birthday: 生日
///   - cityCode: 城市代码
///   - gender: 性别
///   - id: 用户 ID
///   - mobile: 手机号
///   - nickname: 昵称
///   - profession: 职业
///   - provinceCode: 省份代码
///   - token: 登录令牌（用于后续请求的身份验证）
/// 
/// 特性:
/// 1. 类型安全：返回强类型的 UserInfo 对象，而非动态类型
/// 2. 自动转换：通过 fromJson 方法将 JSON 数据转换为模型对象
/// 3. 异常处理：由 DioRequest 统一处理网络异常
/// 4. Token 管理：登录后获得的 token 可用于后续需要认证的接口
/// 
/// 使用示例:
/// ```dart
/// // 调用登录接口
/// try {
///   final userInfo = await loginAPI({
///     'mobile': '13800138000',
///     'code': '123456'
///   });
///   
///   // 访问用户信息
///   print('登录成功，欢迎 ${userInfo.nickname}');
///   print('用户 Token: ${userInfo.token}');
///   
///   // 保存 token 到本地存储
///   await SharedPreferences.getInstance().then((prefs) {
///     prefs.setString('token', userInfo.token);
///   });
/// } catch (e) {
///   // 处理登录失败
///   print('登录失败：$e');
/// }
/// ```
/// 
/// 与旧版本的对比:
/// @{@template compare_with_old_version}
/// **旧版本代码** (已注释):
/// ```dart
/// Future<dynamic> loginAPI(Map<String, dynamic> data) async {
///   return dioRequest.post(HttpConstants.LOGIN, data: data);
/// }
/// ```
/// 
/// **主要区别**:
/// 
/// | 对比项 | 旧版本 | 新版本 | 优势说明 |
/// |--------|--------|--------|----------|
/// | **返回类型** | `Future<dynamic>` | `Future<UserInfo>` | ✅ 类型安全，编译时检查<br>✅ IDE 智能提示<br>✅ 避免运行时类型错误 |
/// | **数据处理** | 直接返回原始数据 | 转换为 UserInfo 对象 | ✅ 数据结构清晰<br>✅ 属性访问方便<br>✅ 减少拼写错误 |
/// | **代码可维护性** | 低，需要手动解析 | 高，自动解析 | ✅ 减少重复代码<br>✅ 易于扩展和修改 |
/// | **错误检测** | 运行时才能发现 | 编译时就能发现 | ✅ 提前发现问题<br>✅ 降低调试成本 |
/// | **团队协作** | 需要文档说明返回结构 | 代码即文档 | ✅ 降低沟通成本<br>✅ 新人上手更快 |
/// 
/// **改进原因**:
/// 1. **类型安全问题**：`dynamic` 类型失去了 Dart 的类型系统保护
/// 2. **使用不便**：每次调用都需要手动解析 JSON 或进行类型转换
/// 3. **容易出错**：属性名称拼写错误只能在运行时发现
/// 4. **代码可读性差**：不清楚返回的数据结构
/// 
/// **改进方案**:
/// 1. 创建 UserInfo 模型类，定义明确的数据结构
/// 2. 在模型类中实现 `fromJson` 工厂方法
/// 3. API 方法返回具体类型而非 `dynamic`
/// 4. 在 API 层完成数据转换，调用方直接使用对象
/// @{@endtemplate}
Future<UserInfo> loginAPI(Map<String, dynamic> data) async {
  // 发起 POST 请求到登录接口
  // HttpConstants.LOGIN: 登录接口路径常量
  // data: 请求体参数（手机号、验证码等）
  // await: 等待异步请求完成，获取响应数据（Map<String, dynamic>类型）
  final responseData = await dioRequest.post(HttpConstants.LOGIN, data: data);
  
  // 将响应的 JSON 数据转换为 UserInfo 对象
  // UserInfo.fromJson: 工厂方法，负责解析 JSON 并创建 UserInfo 实例
  return UserInfo.fromJson(responseData);
}
