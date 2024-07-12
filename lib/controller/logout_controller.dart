import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/controller/aut_signup_controller.dart';
import 'package:instagram/model/user_model.dart';
import 'package:instagram/screen/login.dart';

LogOutController logOutController = Get.find<LogOutController>();

class LogOutController extends GetxController {
  final GetConnect _http = GetConnect();

  Future<void> logOut(BuildContext context) async {
    String token = storage.read('token');
    Map<String, String> headers = {
      'Accept': '*/*',
      'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
      'Content-Type': 'application/json; charset=UTF-8'
    };

    String jsonData = jsonEncode(<String, String>{
      'token': token,
    });

    final response = await _http.post(
      'http://192.168.1.105/instagram/screen/logout.php',
      headers: headers,
      jsonData,
    );

    try {
      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.bodyString!);

        debugPrint("responseBody: ${responseBody.toString()}");

        bool success = responseBody['success'];
        String message = responseBody['message'].toString();

        if (success) {
          removeToken();
          if (autLoginController.scaffoldKey.currentState?.isEndDrawerOpen ??
              false) {
            Navigator.of(autLoginController.scaffoldKey.currentContext!).pop();
          }
          Get.snackbar(
            'Success',
            message,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 5),
          );
          /*  Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const Login(),
            ),
            (route) => false,
          );*/
          Get.offAll(() => const Login());
        } else {
          Get.snackbar(
            'Error',
            message,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 5),
          );
        }
      }
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  Future<String?> removeToken() async {
    await storage.remove('token');
    // Reset the userModel.value to a new instance of UserModel
    autLoginController.userModel.value = UserModel(
      id: 0,
      fullName: '',
      email: '',
      picProfile: '',
      password: '',
      success: false,
      message: '',
      data: null,
    );
    // Trigger an update
    update();
    return null;
  }
}
