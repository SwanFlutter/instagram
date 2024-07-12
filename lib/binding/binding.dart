import 'package:get/get.dart';
import 'package:instagram/controller/aut_login_controller.dart';
import 'package:instagram/controller/aut_signup_controller.dart';
import 'package:instagram/controller/edit_controller.dart';
import 'package:instagram/controller/logout_controller.dart';

class MyBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AutControllerSignUp());
    Get.lazyPut(() => AutLoginController());
    Get.lazyPut(() => LogOutController());
    Get.lazyPut(() => EditController());
  }
}
