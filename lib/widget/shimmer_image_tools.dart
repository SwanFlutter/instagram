import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerImage extends StatelessWidget {
  /// [height] The height of the shimmer effect.
  final double height;

  /// [width] The width of the shimmer effect.
  final double width;

  /// [baseColorShimmer] The base color used for the shimmer effect.
  final Color baseColorShimmer;

  /// [highlightColorShimmer] The highlight color used for the shimmer effect.
  final Color highlightColorShimmer;

  /// [colorShimmer] The color used to create the shimmer effect.
  final Color colorShimmer;

  /// [duration] The duration of the shimmer effect.

  final Duration duration;

  final ShimmerDirection direction;

  final BoxShape shape;

  const ShimmerImage({
    super.key,
    required this.height,
    required this.width,
    required this.baseColorShimmer,
    required this.highlightColorShimmer,
    required this.colorShimmer,
    this.duration = const Duration(milliseconds: 1500),
    this.direction = ShimmerDirection.ltr,
    this.shape = BoxShape.circle,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      // enabled: true,
      direction: direction,
      period: duration,
      baseColor: baseColorShimmer,
      highlightColor: highlightColorShimmer,
      child: SizedBox(
        height: height,
        width: width,
        child: Container(
          height: height,
          width: width,
          decoration:
              BoxDecoration(color: colorShimmer, shape: BoxShape.circle),
        ),
      ),
    );
  }
}
