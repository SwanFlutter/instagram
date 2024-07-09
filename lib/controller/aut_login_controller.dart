// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/main-page.dart';
import 'package:instagram/model/user_model.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

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

  void login(BuildContext context) async {
    if (email.text.isNotEmpty && password.text.isNotEmpty) {
      Get.snackbar(
        "Warning",
        "Please fill in the blank fields",
        margin: const EdgeInsets.all(15.0),
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        barBlur: 5,
        backgroundColor: Colors.deepOrangeAccent,
        colorText: Colors.white,
      );
    } else if (!email.text.isEmail) {
      Get.snackbar(
        "Warning",
        "Invalid email format",
        margin: const EdgeInsets.all(15.0),
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        barBlur: 5,
        backgroundColor: Colors.deepOrangeAccent,
        colorText: Colors.white,
      );
    } else if (password.text.length < 8) {
      Get.snackbar(
        "Warning",
        "Password must be at least 8 characters",
        margin: const EdgeInsets.all(15.0),
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        barBlur: 5,
        backgroundColor: Colors.deepOrangeAccent,
        colorText: Colors.white,
      );
    } else {
      bool isConnected = await userModel.value.checkInternet();

      if (isConnected) {
        Get.showOverlay(
          asyncFunction: () => checkLogin(),
          loadingWidget: LoadingAnimationWidget.staggeredDotsWave(
            color: Theme.of(context).primaryColor,
            size: 24,
          ),
        );
      } else {
        Get.snackbar('Error', 'No internet connection',
            backgroundColor: Colors.red);
        return;
      }
    }
  }

  Future<UserModel?> checkLogin() async {
    var jsonData = userModel.value;

    var url = "https://reqres.in/api/login";

    var body = {
      "email": email.text.trim(),
      "password": password.text.trim(),
    };

    var headers = {"Content-Type": "application/json"};

    var response = await _http.post(url, json.encode(body), headers: headers);

    try {
      if (response.statusCode == 200) {
        jsonData = UserModel.fromJson(json.decode(response.body));
        bool success = jsonData.success ?? false;
        String message = jsonData.message ?? 'Unknown error';

        if (success) {
          Get.snackbar(
            'Success',
            message,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 5),
          );
          Get.to(() => const MainPage());
        } else {
          Get.snackbar(
            'Error',
            message,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 5),
          );
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      debugPrint('Error: $e');
      Get.snackbar(
        'Error',
        e.toString(),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 5),
      );
    }

    return jsonData;
  }
}
