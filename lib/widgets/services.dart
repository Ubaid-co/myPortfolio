// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../consts/constants.dart';
import '../utils/colors.dart';
import '../utils/textStyle.dart';

class ServicesPortion extends StatefulWidget {
  final double height;
  final double width;
  final Color color;
  final String text;
  final List<ServicesData> servicesData;

  const ServicesPortion({
    super.key,
    this.height = 600,
    this.width = double.infinity,
    required this.color,
    required this.text,
    required this.servicesData,
  });

  @override
  State<ServicesPortion> createState() => _ServicesPortionState();
}

class _ServicesPortionState extends State<ServicesPortion> {
  final Color hoverColor = orangeColor;
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
      height: widget.height,
      width: widget.width,
      color: widget.color,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 50,
                height: 3,
                decoration: BoxDecoration(
                  color: appWhiteColor,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                width: 10,
                height: 2,
                decoration: BoxDecoration(
                  color: appWhiteColor,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                width: 5,
                height: 5,
                decoration: BoxDecoration(color: orangeColor, shape: BoxShape.circle),
              ),
              SizedBox(
                width: 10,
              ),
              Text(widget.text, style: headingTextStyle.copyWith(color: appWhiteColor, fontSize: 22)),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Text("What Can I Do Best ?", style: headingTextStyle.copyWith(color: orangeColor, fontSize: 38)),
          SizedBox(height: 40),
          SizedBox(
            height: 250,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: widget.servicesData.length,
              itemBuilder: (context, index) {
                var data = widget.servicesData[index];
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
    return MouseRegion(
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
      child: Container(
        height: 230,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                height: 210,
                width: 200,
                decoration: BoxDecoration(
                  color: blackColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: appBarTextStyle.copyWith(color: appWhiteColor),
                      ),
                      SizedBox(height: 7),
                      Container(height: 3,width: 35, color: orangeColor),
                      SizedBox(height: 7),
                      Text(
                        description,
                        style: descriptionStyle.copyWith(color: appWhiteColor),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 15,
                left: 20,
                child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: orangeColor,
                shape: BoxShape.circle,
              ),
            ))
          ],
        ),
      ),
    );
  }
}
