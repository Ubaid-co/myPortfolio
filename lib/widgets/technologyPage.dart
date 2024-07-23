// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';


import '../consts/constants.dart';
import '../utils/colors.dart';
import '../utils/textStyle.dart';

class TechnologyPortion extends StatelessWidget {
  final double height;
  final double width;
  final Color color;
  final String text;
  final List<TechnologyData> servicesData;

  const TechnologyPortion({super.key, this.height = 250, this.width = double.infinity, required this.color, required this.text, required this.servicesData});

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
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: SizedBox(
                height: 100,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: servicesData.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      var data = servicesData[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 60.0),
                        child: serviceContainerWidget(data.title, data.image),
                      );
                    }),
              ),
            )
          ],
        ));
  }

  Widget serviceContainerWidget(String title, image) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          image,
          fit: BoxFit.cover,
          height: 100,
          width: 100,
          color: buttonColor,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: appBarTextStyle.copyWith(color: textBlackColor),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
