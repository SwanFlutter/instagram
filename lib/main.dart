import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_blur/image_blur.dart';
import 'package:instagram/binding/binding.dart';
import 'package:instagram/screen/login.dart';
import 'package:instagram/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ImageBlur.init();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      onInit: () {
        autLoginController.getToken();
        autLoginController.initializeToken();
        autLoginController.onInit();
      },
      title: 'Flutter Instagram',
      initialBinding: MyBinding(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
