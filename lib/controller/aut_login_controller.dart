// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/controller/aut_signup_controller.dart';
import 'package:instagram/main-page.dart';
import 'package:instagram/model/user_model.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AutLoginController extends GetxController {
  final GetConnect _http = GetConnect();

  Rx<UserModel> userModel = UserModel().obs;

  late TextEditingController email;
  late TextEditingController password;
  RxBool isObscureLogin = true.obs;

  String? token;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void openDrawers() {
    scaffoldKey.currentState?.openEndDrawer();
    update();
  }

  String? getToken() {
    return storage.read("token");
  }

  void initializeToken() {
    token = getToken();

    if (token != null) {
      Map<String, dynamic> jwt = Jwt.parseJwt(token!);
      try {
        userModel.value = UserModel.fromMap(jwt);
      } catch (e) {
        debugPrint("Error parsing Token: $e");
      }
    }
    update();
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    initializeToken();
    getToken();
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
    if (email.text.isEmpty && password.text.isEmpty) {
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
    } else if (password.text.length > 8) {
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

  Future<void> checkLogin() async {
    var url = "http://192.168.1.105/instagram/screen/login.php";

    var body = jsonEncode({
      "email": email.text.trim(),
      "password": password.text.trim(),
    });

    Map<String, String> headers = {
      'Accept': '*/*',
      'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
      'Content-Type': 'application/json'
    };

    var response = await _http.post(url, body, headers: headers);

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.bodyString!);

      debugPrint("JSON: ${jsonData.toString()}");
      debugPrint("statusCode: ${response.statusCode}");

      bool success = jsonData['success'];
      String message = jsonData['message'].toString();

      if (success) {
        storage.write("token", jsonData['data']['jwt']);
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
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } else {
      throw Exception('Failed to load data');
    }
  }
}
