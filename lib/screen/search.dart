import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_blur/image_blur.dart';
import 'package:instagram/constant.dart';

class Search extends StatelessWidget {
  const Search({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            width: size.width,
            height: size.height,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: size.width * 0.95,
                      child: SearchBar(
                        hintText: 'Search',
                        shape: WidgetStatePropertyAll(BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                        hintStyle: const WidgetStatePropertyAll(
                            TextStyle(color: Colors.grey)),
                        elevation: WidgetStateProperty.all(1.0),
                        leading: const Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 5.0),
                    child: GridView.count(
                      physics: const BouncingScrollPhysics(),
                      crossAxisSpacing: 5.0,
                      mainAxisSpacing: 5.0,
                      crossAxisCount: 3,
                      children: List.generate(
                        imageUrls.length,
                        (index) {
                          bool isLarge = Random().nextBool();

                          return ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Container(
                              height: isLarge ? 200 : 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: ImageBlur(
                                imageUrl: imageUrls[index],
                                width: size.width,
                                height: size.height,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Text('Error');
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




/*
GridView.custom(
                      physics: const BouncingScrollPhysics(),
                      gridDelegate: SliverQuiltedGridDelegate(
                        crossAxisSpacing: 5.0,
                        mainAxisSpacing: 5.0,
                        crossAxisCount: 3,
                        repeatPattern: QuiltedGridRepeatPattern.inverted,
                        pattern: [
                          const QuiltedGridTile(2, 2),
                          const QuiltedGridTile(1, 1),
                          const QuiltedGridTile(1, 1),
                          const QuiltedGridTile(1, 1),
                          const QuiltedGridTile(1, 1),
                          const QuiltedGridTile(1, 1),
                          const QuiltedGridTile(1, 1),
                          const QuiltedGridTile(1, 1),
                          const QuiltedGridTile(1, 1),
                        ],
                      ),
                      childrenDelegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: ImageBlur.imageRectangleBlur(
                                isBlur: true,
                                isShimmer: true,
                                imageNetwork: imageUrls[index],
                                width: size.width,
                                height: size.height,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
 */