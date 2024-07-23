// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/textStyle.dart';
import 'buttons.dart';


class ProductsPortion extends StatelessWidget {
  final bool isMobile;
  const ProductsPortion({super.key, this.isMobile = false});

  @override
  Widget build(BuildContext context) {
    return Column(children: [websiteWidget(), appWidget(), blockChainWidget(), contentWritingWidget(), uiUxWidget(), graphicsWidget()]);
  }

  Widget websiteWidget() {
    return productContainerWidget(
        "Website Development",
        "App development involves creating software applications for various platforms, such as\n\nmobile, web, or desktop.It encompasses designing user\n\ninterfaces, writing code,testing, and deploying the application\n\nto ensure it meets users' needs and functions smoothly.\n\nApp development involves creating software applications for various platforms, such as\n\nmobile, web, or desktop.It encompasses designing user\n\ninterfaces, writing code,testing, and deploying the application\n\nto ensure it meets users' needs and functions smoothly.\n\nApp development involves creating software applications for various platforms, such as\n\nmobile, web, or desktop.It encompasses designing user",
        'assets/webTemplate.jpg',
        () {},
        deepBlackColor,
        textWhiteColor);
  }

  Widget appWidget() {
    return productContainerWidget(
        "Application Development",
        "App development involves creating software applications for various platforms, such as\n\nmobile, web, or desktop.It encompasses designing user\n\ninterfaces, writing code,testing, and deploying the application\n\nto ensure it meets users' needs and functions smoothly.\n\nApp development involves creating software applications for various platforms, such as\n\nmobile, web, or desktop.It encompasses designing user\n\ninterfaces, writing code,testing, and deploying the application\n\nto ensure it meets users' needs and functions smoothly.\n\nApp development involves creating software applications for various platforms, such as\n\nmobile, web, or desktop.It encompasses designing user",
        'assets/mobileTemplate.jpg',
        () {},
        appWhiteColor,
        deepBlackColor);
  }

  Widget blockChainWidget() {
    return productContainerWidget(
        "Block Chain Development",
        "App development involves creating software applications for various platforms, such as\n\nmobile, web, or desktop.It encompasses designing user\n\ninterfaces, writing code,testing, and deploying the application\n\nto ensure it meets users' needs and functions smoothly.\n\nApp development involves creating software applications for various platforms, such as\n\nmobile, web, or desktop.It encompasses designing user\n\ninterfaces, writing code,testing, and deploying the application\n\nto ensure it meets users' needs and functions smoothly.\n\nApp development involves creating software applications for various platforms, such as\n\nmobile, web, or desktop.It encompasses designing user",
        'assets/blockchainTemplate.jpg',
        () {},
        deepBlackColor,
        textWhiteColor);
  }

  Widget contentWritingWidget() {
    return productContainerWidget(
        "Content Writing",
        "App development involves creating software applications for various platforms, such as\n\nmobile, web, or desktop.It encompasses designing user\n\ninterfaces, writing code,testing, and deploying the application\n\nto ensure it meets users' needs and functions smoothly.\n\nApp development involves creating software applications for various platforms, such as\n\nmobile, web, or desktop.It encompasses designing user\n\ninterfaces, writing code,testing, and deploying the application\n\nto ensure it meets users' needs and functions smoothly.\n\nApp development involves creating software applications for various platforms, such as\n\nmobile, web, or desktop.It encompasses designing user",
        'assets/writingTemplate.jpeg',
        () {},
        deepGreenColor,
        textWhiteColor);
  }

  Widget uiUxWidget() {
    return productContainerWidget(
        "UI UX Designing",
        "App development involves creating software applications for various platforms, such as\n\nmobile, web, or desktop.It encompasses designing user\n\ninterfaces, writing code,testing, and deploying the application\n\nto ensure it meets users' needs and functions smoothly.\n\nApp development involves creating software applications for various platforms, such as\n\nmobile, web, or desktop.It encompasses designing user\n\ninterfaces, writing code,testing, and deploying the application\n\nto ensure it meets users' needs and functions smoothly.\n\nApp development involves creating software applications for various platforms, such as\n\nmobile, web, or desktop.It encompasses designing user",
        'assets/uiuxTemplate.jpg',
        () {},
        deepBlackColor,
        textWhiteColor);
  }

  Widget graphicsWidget() {
    return productContainerWidget(
        "Graphics Designing",
        "App development involves creating software applications for various platforms, such as\n\nmobile, web, or desktop.It encompasses designing user\n\ninterfaces, writing code,testing, and deploying the application\n\nto ensure it meets users' needs and functions smoothly.\n\nApp development involves creating software applications for various platforms, such as\n\nmobile, web, or desktop.It encompasses designing user\n\ninterfaces, writing code,testing, and deploying the application\n\nto ensure it meets users' needs and functions smoothly.\n\nApp development involves creating software applications for various platforms, such as\n\nmobile, web, or desktop.It encompasses designing user",
        'assets/graphicTemplate.jpg',
        () {},
        buttonColor,
        findButtonColor: appWhiteColor,
        textWhiteColor,
        findButtonTextColor: blackColor);
  }

  Widget productContainerWidget(String title, description, imageUrl, Function() onTap, Color color, Color textColor,
      {Color? findButtonColor, Color? findButtonTextColor}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 35, horizontal: 40),
      height: 520,
      decoration: BoxDecoration(color: color),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: headingTextStyle.copyWith(color: textColor)),
              SizedBox(
                height: 20,
              ),
              Text(
                description,
                style: descriptionStyle.copyWith(color: textColor),
              ),
              SizedBox(
                height: 20,
              ),
              CustomElevatedButton(
                text: "Find out more",
                textColor: findButtonTextColor ?? textWhiteColor,
                onPressed: onTap,
                backgroundColor: findButtonColor ?? buttonColor,
                width: 40,
                height: 40,
                isPadding: false,
              )
            ],
          ),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: blackColor.withOpacity(0.5), // Shadow color
                  spreadRadius: 4, // Spread radius
                  blurRadius: 7, // Blur radius
                  offset: Offset(0, 2), // Shadow position (x, y)
                ),
              ],
            ),
            child: Image.asset(
              height: 370,
              width: 600,
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
