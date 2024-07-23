// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../utils/textStyle.dart';
import 'cacheNetworkImage.dart';

class ClientsPortion extends StatelessWidget {
  final double height;
  final double width;
  final Color color;
  final String text;
  final List? image;

  const ClientsPortion({
    super.key,
    this.height = 250,
    this.width = double.infinity,
    required this.color,
    required this.text,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      height: height,
      width: width,
      color: color,
      child: Column(
        children: [
          Text(
            text,
            style: headingTextStyle,
          ),
          SizedBox(height: 20),
          if (image != null && image!.isNotEmpty)
            SizedBox(
              height: 100,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: image!.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: imageWidget(image![index]),
                  );
                },
              ),
            )
          else
            Center(
              child: Text("No images available", style: TextStyle(color: Colors.grey)),
            ),
        ],
      ),
    );
  }

  Widget imageWidget(String imageUrl) {
    return cachedNetworkImage(imageUrl, width: 200, height: 100);
  }
}

