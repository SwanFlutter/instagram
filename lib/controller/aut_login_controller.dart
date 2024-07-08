import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/model/user_model.dart';

class AutLoginController extends GetxController {
  final GetConnect _http = GetConnect();

  Rx<UserModel> userModel = UserModel().obs;

  late TextEditingController email;
  late TextEditingController password;
  RxBool isObscureLogin = true.obs;

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  void togglePassword() {
    isObscureLogin.value = !isObscureLogin.value;
  }

  void login(BuildContext context) {}
}
