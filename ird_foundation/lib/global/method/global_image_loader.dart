import 'package:flutter/material.dart';
import '../constants/enum.dart';

class GlobalImageLoader extends StatelessWidget {
  const GlobalImageLoader({
    Key? key,
    required this.imagePath,
    this.imageFor = ImageFor.asset,
    this.height,
    this.width,
    this.fit,
    this.borderRadius = BorderRadius.zero,
  }) : super(key: key);
  final String imagePath;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final ImageFor imageFor;
  final BorderRadiusGeometry borderRadius;

  @override
  Widget build(BuildContext context) {
    if (imageFor == ImageFor.network) {
      return ClipRRect(
        borderRadius: borderRadius,
        child: Image.network(
          imagePath,
          height: height,
          width: width,
          fit: fit,
          errorBuilder: (context, exception, stackTrace) => const Text('😢'),
        ),
      );
    } else {
      return ClipRRect(
        borderRadius: borderRadius,
        child: Image.asset(
          imagePath,
          height: height,
          width: width,
          fit: fit,
          errorBuilder: (context, exception, stackTrace) => const Text('😢'),
        ),
      );
    }
  }
}
