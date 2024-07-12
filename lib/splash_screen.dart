import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/main-page.dart';
import 'package:instagram/screen/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat();

    _rotationAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);

    Future.delayed(const Duration(seconds: 5), () {
      _controller.stop();
      Get.off(() => autLoginController.getToken() != null
          ? const MainPage()
          : const Login());
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: RotationTransition(
          turns: _rotationAnimation,
          child: Image.asset(
            'assets/instagram_instagram_logo.png',
            width: 150,
            height: 150,
          ),
        ),
      ),
    );
  }
}
