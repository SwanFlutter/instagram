import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_blur/image_blur.dart';
import 'package:instagram/binding/binding.dart';
import 'package:instagram/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ImageBlur.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
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
