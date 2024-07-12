import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:instagram/screen/login.dart';

class EditController extends GetxController {
  final GetStorage box = GetStorage();
  late TextEditingController fullName;
  File? files;

  void getPicImage(File file) {
    files = file;
    update();
  }

  void save(BuildContext context) async {
    if (fullName.text.trim().isEmpty) {
      Get.snackbar(
        'Error',
        'Full name is required',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.deepOrangeAccent,
        colorText: Colors.white,
        margin: const EdgeInsets.all(15.0),
      );
    } else {
      bool isConnected =
          await autLoginController.userModel.value.checkInternet();
      if (!isConnected) {
        Get.snackbar('Error', 'No internet connection',
            backgroundColor: Colors.red);
        return;
      }
      Get.showOverlay(
        asyncFunction: () => updateData(context),
        loadingWidget: const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      );
    }
  }

  Future<void> updateData(BuildContext context) async {
    var url = 'http://192.168.1.105/instagram/screen/update.php';

    Map<String, String> body = {
      "fullName": fullName.text.trim(),
      "email": autLoginController.userModel.value.email!,
    };

    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.fields.addAll(body);

    if (files != null) {
      String fileExtension = files!.path.split('.').last.toLowerCase();
      MediaType contentType;
      switch (fileExtension) {
        case '.png':
          contentType = MediaType('image', 'png');
          break;
        case '.gif':
          contentType = MediaType('image', 'gif');
          break;
        case '.jpg':
          contentType = MediaType('image', 'jpg');
          break;
        case '.jpeg':
          contentType = MediaType('image', 'jpeg');
          break;
        default:
          contentType = MediaType('image', 'png');
          break;
      }

      http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
        'image',
        files!.path,
        contentType: contentType,
      );

      request.files.add(multipartFile);
    }

    try {
      var response = await request.send();

      if (response.statusCode == 200) {
        var responseBody = await response.stream.bytesToString();

        if (responseBody.toString().isEmpty) {
          throw Exception('Empty response from server');
        }

        var jsonData = jsonDecode(responseBody.toString());

        bool success = jsonData['success'].toString() == 'true';
        String message = jsonData['message'].toString();

        if (success) {
          var token = jsonData['data']['jwt'];

          box.write('token', token);

          Get.snackbar(
            'Success',
            message,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            backgroundColor: Colors.greenAccent,
            duration: const Duration(seconds: 5),
          );
          Navigator.pop(context);
          fullName.clear();
          autLoginController.initializeToken();
          autLoginController.update();
        } else {
          debugPrint("Error: $message");
          Get.snackbar(
            'Error',
            message,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            backgroundColor: Colors.red,
          );
        }
      } else {
        debugPrint("Error: ${response.statusCode}");
        Get.snackbar(
          'Error',
          'Failed to update profile',
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          backgroundColor: Colors.red,
        );
      }
    } on SocketException catch (e) {
      // Handle SocketException (network connection issue)
      debugPrint('Connection error: ${e.toString()}');
      Get.snackbar(
        'Error',
        'Connection error: ${e.toString()}',
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        backgroundColor: Colors.red,
      );
    } catch (e) {
      debugPrint('An unexpected error occurred: ${e.toString()}');
      Get.snackbar(
        'Error',
        'An unexpected error occurred: ${e.toString()}',
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        backgroundColor: Colors.red,
      );
    }
  }

  @override
  void onInit() {
    fullName = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    fullName.dispose();
    super.dispose();
  }
}
