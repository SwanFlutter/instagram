import 'package:flutter/material.dart';
import 'package:image_blur/image_blur.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: const Text('Favorite'),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const ImageBlur(
                  width: 200,
                  height: 250,
                  imageUrl:
                      "https://images.pexels.com/photos/1496372/pexels-photo-1496372.jpeg?auto=compress&cs=tinysrgb&w=1600"),
              const SizedBox(
                height: 15,
              ),
              const ImageBlur(
                  width: 200,
                  height: 250,
                  imageUrl:
                      "https://images.pexels.com/photos/1496372/pexels-photo-1496372.jpeg?auto=compress&cs=tinysrgb&w=1600"),
              ImageBlur.imageCircularBlur(
                  imageAssets: "assets/post.jpg", size: 250),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
