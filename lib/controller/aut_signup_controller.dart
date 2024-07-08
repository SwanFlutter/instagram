import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/model/user_model.dart';
import 'package:instagram/screen/login.dart';

class AutControllerSignUp extends GetxController {
  final GetConnect _http = GetConnect();

  Rx<UserModel> userModel = UserModel().obs;

  late TextEditingController fullName, email, password, confirmPassword;

  RxBool isObscure = true.obs;

  @override
  void onInit() {
    fullName = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    confirmPassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    fullName.dispose();
    email.dispose();
    password.dispose();
    confirmPassword.dispose();

    super.dispose();
  }

  void togglePassword() {
    isObscure.value = !isObscure.value;
  }

  void signUp(BuildContext context) async {
    if (fullName.text.isNotEmpty &&
        email.text.isNotEmpty &&
        password.text.isNotEmpty &&
        confirmPassword.text.isNotEmpty) {
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
    } else if (fullName.text.length > 35) {
      Get.snackbar(
        "Warning",
        "Name is too long",
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
    } else if (password.text.length <= 8) {
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
    } else if (password.text != confirmPassword.text) {
      Get.snackbar(
        "Warning",
        "Passwords do not match",
        margin: const EdgeInsets.all(15.0),
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        barBlur: 5,
        backgroundColor: Colors.deepOrangeAccent,
        colorText: Colors.white,
      );
    } else {
      bool isConnected = await UserModel.checkInternet();

      if (isConnected) {
        Get.showOverlay(asyncFunction: () => checkSignUp(context));
      } else {
        Get.snackbar('Error', 'No internet connection',
            backgroundColor: Colors.red);
        return;
      }
    }
  }

  Future<UserModel?> checkSignUp(BuildContext context) async {
    var jsonData = userModel.value;
    var url = "https://reqres.in/api/users";
    var body = {
      "fullName": fullName.text.trim(),
      "email": email.text.trim(),
      "password": password.text.trim(),
    };

    var headers = {"Content-Type": "application/json"};

    final response = await _http.post(url, json.encode(body), headers: headers);

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
          Get.to(() => const Login());
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
        throw Exception(
            'Sign up failed with status code: ${response.statusCode}');
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
