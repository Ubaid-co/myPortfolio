// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../utils/colors.dart';
import 'buttons.dart';
import 'cacheNetworkImage.dart';

class ImageCacheContainer extends StatefulWidget {
  final double height;
  final double width;
  final String image;
  final bool isMobileView;

  const ImageCacheContainer({super.key, this.height = 200, this.width = double.infinity, required this.image, this.isMobileView = false});

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
  final bool isMobileView;
  final Function() portfolioOnPressed;
  final Function() hireMeOnPressed;

  const ImageAssetContainer({
    Key? key,
    this.height = 200,
    this.width = double.infinity,
    required this.image,
    required this.portfolioOnPressed,
    required this.hireMeOnPressed,
    this.isMobileView = false,
  }) : super(key: key);

  @override
  State<ImageAssetContainer> createState() => _ImageAssetContainerState();
}

class _ImageAssetContainerState extends State<ImageAssetContainer> {
  Color hoverColor = orangeColor;
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isMobile = constraints.maxWidth < 600; // You can adjust the breakpoint as needed
        final double buttonWidth = isMobile ? 20 : 150; // Adjust button width based on screen size
        double buttonHeight = isMobile ? 30 : 50; // Common height for both buttons

        return Stack(
          children: [
            Container(
              color: landingImageColor, // Update this to your landingImageColor
              height: widget.height,
              width: widget.width,
              child: Image.asset(
                widget.image,
                fit: widget.isMobileView ? BoxFit.contain : BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: isMobile ? 20 : 100,
              left: isMobile ? constraints.maxWidth / 5.2 - (buttonWidth * 2 + 30) / 2 : constraints.maxWidth / 4.6 - (buttonWidth * 2 + 30) / 2,
              child: Row(
                children: [
                  CustomElevatedButton(
                    text: "Portfolio",
                    textColor: Colors.white,
                    // Update this to your textWhiteColor
                    onPressed: widget.portfolioOnPressed,
                    backgroundColor: Colors.orange,
                    // Update this to your orangeColor
                    width: buttonWidth,
                    height: buttonHeight,
                    fontSize: widget.isMobileView ? 6 : 16,
                    isPadding: false,
                  ),
                  SizedBox(width: widget.isMobileView ? 10 : 30),
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
                      textColor: Colors.white,
                      // Update this to your textWhiteColor
                      onPressed: widget.hireMeOnPressed,
                      backgroundColor: isHovered ? Colors.orange : darkGreenColor,
                      // Update this to your darkGreenColor or buttonColor
                      width: buttonWidth,
                      height: buttonHeight,
                      fontSize: widget.isMobileView ? 6 : 16,
                      isPadding: false,
                      hover: true,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
