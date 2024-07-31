// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/skills.dart';

import '../consts/constants.dart';
import '../utils/colors.dart';
import '../utils/textStyle.dart';

class ServicesPortion extends StatefulWidget {
  final double height;
  final double width;
  final Color color;
  final String text;
  final List<ServicesData> servicesData;
  final Function() hireMeOnPressed;

  const ServicesPortion({
    super.key,
    this.height = 1200,
    this.width = double.infinity,
    required this.color,
    required this.text,
    required this.servicesData,
    required this.hireMeOnPressed
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
      padding: EdgeInsets.only(top: 50),
      width: widget.width,
      color: widget.color,
      child: Column(
        children: [
          Column(
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
                height: 270,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.servicesData.length,
                  itemBuilder: (context, index) {
                    var data = widget.servicesData[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: serviceContainerWidget(data.title, data.description, data.image),
                    );
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 100,),
          SkillsPage(hireMeOnPressed: widget.hireMeOnPressed),
        ],
      ),
    );
  }

  Widget serviceContainerWidget(String title, String description,image) {
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
        height: 250,
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
                height: 230,
                width: 200,
                decoration: BoxDecoration(
                  color: blackColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: appBarTextStyle.copyWith(color: appWhiteColor),
                      ),
                      SizedBox(height: 12),
                      Container(height: 3,width: 35, color: orangeColor),
                      SizedBox(height: 12),
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
                  padding: EdgeInsets.all(10),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: orangeColor,
                shape: BoxShape.circle,
              ),
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                    height: 40,
                    width: 40,
                    color: appWhiteColor,
                  ),
            ))
          ],
        ),
      ),
    );
  }
}
