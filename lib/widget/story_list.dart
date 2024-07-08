import 'package:avatar_better/avatar_better.dart';
import 'package:flutter/material.dart';
import 'package:instagram/widget/shimmer_image_tools.dart';

import '../constant.dart';

class StoryList extends StatelessWidget {
  const StoryList({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      height: 95,
      child: FutureBuilder<List<String>>(
        future: Future.delayed(
          const Duration(seconds: 3),
          () => picList,
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: picList.length,
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.only(left: 5.0, right: 5.0),
                  child: ShimmerImage(
                    duration: Duration(milliseconds: 1000),
                    height: 40 * 2,
                    width: 40 * 2,
                    baseColorShimmer: Color.fromRGBO(224, 224, 224, 1),
                    highlightColorShimmer: Color.fromRGBO(245, 245, 245, 1),
                    colorShimmer: Colors.white,
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return const Center(child: Text("Error"));
          } else if (snapshot.hasData) {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: picList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Avatar(
                          image: picList[index],
                          text: '',
                          radius: 30,
                          isBorderAvatar: true,
                          gradientWidthBorder: const LinearGradient(
                            colors: [
                              Color(0XffFBAA47),
                              Color(0XffD91A46),
                              Color(0XffA60F93),
                            ],
                          ),
                        ),
                      ),
                      const Text("Your Story"),
                    ],
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text("Error"));
          }
        },
      ),
    );
  }
}
