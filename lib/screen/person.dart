import 'package:flutter/material.dart';
import 'package:image_blur/image_blur.dart';

class Person extends StatelessWidget {
  const Person({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Person'),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 2000,
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              SingleChildScrollView(
                child: GridView.builder(
                  itemCount: 8,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 3,
                    mainAxisSpacing: 3,
                  ),
                  shrinkWrap: true, // این خط اضافه شده است
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: double.infinity,
                      width: double.infinity,
                      child: ImageBlur.imageCircularBlur(
                        isBlur: true,
                        imageNetwork:
                            "https://images.pexels.com/photos/1420440/pexels-photo-1420440.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
