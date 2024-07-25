// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../utils/colors.dart';
import 'buttons.dart';
import 'cacheNetworkImage.dart';

class ImageCacheContainer extends StatefulWidget {
  final double height;
  final double width;
  final String image;

  const ImageCacheContainer({super.key, this.height = 200, this.width = double.infinity, required this.image});

  @override
  State<ImageCacheContainer> createState() => _ImageCacheContainerState();
}

class _ImageCacheContainerState extends State<ImageCacheContainer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: cachedNetworkImage(widget.image),
    );
  }
}

class ImageAssetContainer extends StatefulWidget {
  final double height;
  final double width;
  final String image;
  final Function() portfolioOnPressed;

  const ImageAssetContainer({super.key, this.height = 200, this.width = double.infinity, required this.image, required this.portfolioOnPressed});

  @override
  State<ImageAssetContainer> createState() => _ImageAssetContainerState();
}

class _ImageAssetContainerState extends State<ImageAssetContainer> {
  Color hoverColor = orangeColor;
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: widget.height,
          width: widget.width,
          child: Image.asset(
            widget.image,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 470,
          left: 147,
          child: Row(
            children: [
              CustomElevatedButton(
                text: "Portfolio",
                textColor: textWhiteColor,
                onPressed: widget.portfolioOnPressed,
                backgroundColor: orangeColor,
                width: 40,
                height: 50,
                isPadding: false,
              ),
              SizedBox(
                width: 30,
              ),
              MouseRegion(
                onEnter: (_) {
                  setState(() {
                    isHovered = true;
                  });
                },
                onExit: (_) {
                  setState(() {
                    isHovered = false;
                  });
                },
                child: CustomElevatedButton(
                  text: "Hire Me",
                  textColor: textWhiteColor,
                  onPressed: () {},
                  backgroundColor: isHovered == true ? orangeColor : darkGreenColor ?? buttonColor,
                  width: 40,
                  height: 50,
                  isPadding: false,
                  hover: true,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
