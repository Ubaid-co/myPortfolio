// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';


import '../consts/constants.dart';
import '../utils/colors.dart';
import '../utils/textStyle.dart';

class ServicesPortion extends StatelessWidget {
  final double height;
  final double width;
  final Color color;
  final String text;
  final List<ServicesData> servicesData;

  const ServicesPortion({
    super.key,
    this.height = 300,
    this.width = double.infinity,
    required this.color,
    required this.text,
    required this.servicesData,
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
          SizedBox(
            height: 170,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: servicesData.length,
              itemBuilder: (context, index) {
                var data = servicesData[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: serviceContainerWidget(data.title, data.description),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget serviceContainerWidget(String title, String description) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      height: 150,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          width: 1,
          color: buttonColor,
          style: BorderStyle.solid,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: appBarTextStyle.copyWith(color: textBlackColor),
          ),
          SizedBox(height: 7),
          Text(
            description,
            style: descriptionStyle,
          ),
        ],
      ),
    );
  }
}

