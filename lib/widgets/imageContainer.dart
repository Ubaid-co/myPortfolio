import 'package:flutter/material.dart';

import 'cacheNetworkImage.dart';

class ImageCacheContainer extends StatelessWidget {
  final double height;
  final double width;
  final String image;

  const ImageCacheContainer({super.key, this.height = 200, this.width = double.infinity, required this.image});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: cachedNetworkImage(image),
    );
  }
}
class ImageAssetContainer extends StatelessWidget {
  final double height;
  final double width;
  final String image;

  const ImageAssetContainer({super.key, this.height = 200, this.width = double.infinity, required this.image});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Image.asset(image, fit: BoxFit.cover,),
    );
  }
}
