import 'package:get/get.dart';
import 'package:hm_shop/viewmodels/user.dart';

//需要共享的对象要有一些共享的属性属性需要响应式更新
class UserController extends GetxController {
  var user = UserInfo.fromJson({}).obs; //响应式对象  user对象被监听了
  //值在user.value中
  updataUserInfo(UserInfo newUser) {  //更新user对象  
    user.value = newUser;
  }
}
