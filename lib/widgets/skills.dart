// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/skillsBubble.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/colors.dart';
import '../utils/textStyle.dart';
import '../widgets/buttons.dart';

class SkillsPage extends StatefulWidget {
  const SkillsPage({super.key});

  @override
  State<SkillsPage> createState() => _SkillsPageState();
}

class _SkillsPageState extends State<SkillsPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final Color hoverColor = orangeColor;
  bool isHovered = false;
  Future<void> _launchURL() async {
    const url = 'https://drive.google.com/file/d/1f8tWey47okgLsseQzo-Sw3asssDzRMW_/view?usp=sharing'; // Replace with your CV URL
    if (!await launch(url)) {
      throw 'Could not launch $url';
    }
  }
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 7),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return _buildWideLayoutAboutSection();
        } else {
          return _buildWideNarrowAboutSection();
        }
      },
    );
  }

  Widget _buildWideLayoutAboutSection() {
    return Container(
      height: 600,
      color: darkGreenColor,
      child: productContainerWidget(
          "Expertise",
          "My Skills & Tools",
          "Every Day is a New Challenge",
          "With a year of experience as a Flutter developer, I specialize in creating cross-platform applications that are both visually stunning and highly functional. My expertise spans Android, iOS, macOS, desktop, and web development, allowing me to deliver cohesive and seamless user experiences across all major platforms. I am passionate about leveraging Flutter's capabilities to build innovative solutions that meet the diverse needs of users, ensuring that every project I undertake stands out for its quality and performance.",
          "assets/mobileTemplate.jpg",
          () {
            _launchURL();
          },
          darkGreenColor,
          appWhiteColor,
          600,
          600,
          370),
    );
  }

  Widget _buildWideNarrowAboutSection() {
    return Container(
      height: 900,
      color: darkGreenColor,
      child: productContainerWidget(
          "Expertise",
          "My Skills & Tools",
          "Every Day is a New Challenge",
          "With a year of experience as a Flutter developer, I specialize in creating cross-platform applications that are both visually stunning and highly functional. My expertise spans Android, iOS, macOS, desktop, and web development, allowing me to deliver cohesive and seamless user experiences across all major platforms. I am passionate about leveraging Flutter's capabilities to build innovative solutions that meet the diverse needs of users, ensuring that every project I undertake stands out for its quality and performance.",
          "assets/mobileTemplate.jpg",
          () {
            _launchURL();
          },
          darkGreenColor,
          appWhiteColor,
          600,
          250,
          150,
          isNarrow: true),
    );
  }

  Widget productContainerWidget(
      String heading1, heading2, heading3, description, imageUrl, Function() onTap, Color color, Color textColor, double height, imageWidth, imageHeight,
      {Color? findButtonColor, Color? findButtonTextColor, bool isNarrow = false}) {
    return Container(
      padding: isNarrow == true ? EdgeInsets.symmetric(vertical: 20, horizontal: 25) : EdgeInsets.symmetric(vertical: 50, horizontal: 0),
      height: height,
      decoration: BoxDecoration(color: color),
      child: isNarrow == false
          ? Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
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
                          Text(heading1, style: headingTextStyle.copyWith(color: textColor, fontSize: 26)),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(heading2, style: headingTextStyle.copyWith(color: orangeColor, fontSize: 38)),
                      SizedBox(
                        height: 20,
                      ),
                      Text(heading3, style: headingTextStyle.copyWith(color: textColor, fontSize: 27)),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 400,
                        child: Text(
                          description,
                          style: descriptionStyle.copyWith(color: textColor, fontSize: 14),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(
                        height: 20,
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
                          textColor: findButtonTextColor ?? textWhiteColor,
                          onPressed: onTap,
                          backgroundColor: isHovered == true ? orangeColor : darkGreenColor ?? buttonColor,
                          width: 40,
                          height: 40,
                          isPadding: false,
                          hover: true,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 30),
                    child: skillSet(),
                  ),
                ],
              ),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 20,
                          height: 1.5,
                          decoration: BoxDecoration(
                            color: appWhiteColor,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: 5,
                          height: .5,
                          decoration: BoxDecoration(
                            color: appWhiteColor,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: 2.5,
                          height: 2.5,
                          decoration: BoxDecoration(color: orangeColor, shape: BoxShape.circle),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(heading1, style: headingTextStyle.copyWith(color: textColor, fontSize: 14)),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(heading2, style: headingTextStyle.copyWith(color: orangeColor, fontSize: 14)),
                    SizedBox(
                      height: 20,
                    ),
                    Text(heading3, style: headingTextStyle.copyWith(color: textColor, fontSize: 14)),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 300,
                      child: Text(
                        description,
                        style: isNarrow == true ? descriptionStyle.copyWith(color: textColor, fontSize: 10) : descriptionStyle.copyWith(color: textColor),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomElevatedButton(
                      text: "Download CV",
                      textColor: findButtonTextColor ?? textWhiteColor,
                      onPressed: onTap,
                      backgroundColor: isHovered == true ? orangeColor : darkGreenColor ?? buttonColor,
                      width: 40,
                      height: 40,
                      isPadding: false,
                      hover: true,
                    )
                  ],
                ),
                skillSet(isNarrow: true)
              ],
            ),
    );
  }

  Widget skillSet({bool isNarrow = false}) {
    return Column(
      children: [
        skillSetRow("Flutter Development", "90", deepBlackColor, pinkShade, isNarrow == true ? 115 : 270, isNarrow: isNarrow),
        SizedBox(
          height: 20,
        ),
        skillSetRow("Graphic Designing", "85", deepBlackColor, blueShade, isNarrow == true ? 95 : 230, expanded: true, isNarrow: isNarrow),
        SizedBox(
          height: 20,
        ),
        skillSetRow("UI UX Designing", "55", deepBlackColor, orangeShade, isNarrow == true ? 60 : 160, ui: true, isNarrow: isNarrow),
        SizedBox(
          height: isNarrow == true ? 20 : 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            skillIndicator("Flutter UI", 0.95, Colors.amber, 95, isNarrow: isNarrow),
            skillIndicator("Firebase", 0.88, Colors.purple, 88, isNarrow: isNarrow),
            skillIndicator("API Integration", 0.9, Colors.pinkAccent, 90, isNarrow: isNarrow),
            skillIndicator("Payment Integration", 0.85, Colors.blueAccent, 85, isNarrow: isNarrow),
          ],
        ),
      ],
    );
  }

  Widget skillSetRow(
    String title,
    number,
    Color containerBgColor,
    containerOverlayColor,
    double width, {
    bool expanded = false,
    bool ui = false,
    bool isNarrow = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style:
              isNarrow == true ? headingTextStyle.copyWith(color: appWhiteColor, fontSize: 10) : headingTextStyle.copyWith(color: appWhiteColor, fontSize: 16),
        ),
        SizedBox(
          width: expanded == true
              ? 28
              : ui == true
                  ? 40
                  : 15,
        ),
        skillSetContainer(
          containerBgColor,
          containerOverlayColor,
          width,
          isNarrow: isNarrow,
        ),
        SizedBox(
          width: 25,
        ),
        skillSetBubble(number, containerOverlayColor, isNarrow: isNarrow),
      ],
    );
  }

  Widget skillSetContainer(
    Color bgColor,
    overlayColor,
    double width, {
    bool isNarrow = false,
  }) {
    return Stack(
      children: [
        Container(
          height: isNarrow == true ? 4 : 7,
          width: isNarrow == true ? 130 : 300,
          decoration: BoxDecoration(
            color: bgColor,
          ),
        ),
        Container(
          height: isNarrow == true ? 4 : 7,
          width: width,
          decoration: BoxDecoration(
            color: overlayColor,
          ),
        )
      ],
    );
  }

  Widget skillSetBubble(
    String text,
    Color bgColor, {
    bool isNarrow = false,
  }) {
    return Center(
      child: SpeechBubble(
        text: text,
        bubbleColor: bgColor, // Customize the color here
        textColor: Colors.white, // Customize the text color here
      ),
    );
  }

  Widget skillIndicator(String skill, double percentage, Color color, int value, {bool isNarrow = false}) {
    return Padding(
      padding: isNarrow == true ? const EdgeInsets.symmetric(horizontal: 8.0) : const EdgeInsets.symmetric(horizontal: 23.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return CircularPercentIndicator(
                radius: isNarrow == true ? 20.0 : 50.0,
                lineWidth: isNarrow == true ? 2.0 : 8.0,
                animation: true,
                percent: percentage * _controller.value,
                center: Text(
                  "${(value * _controller.value).toInt()}",
                  style: isNarrow == true ? headingTextStyle.copyWith(color: appWhiteColor, fontSize: 10) : headingTextStyle.copyWith(color: appWhiteColor),
                ),
                circularStrokeCap: CircularStrokeCap.square,
                progressColor: color,
                backgroundColor: Colors.grey[800]!,
              );
            },
          ),
          SizedBox(height: 10),
          Text(
            skill,
            style: TextStyle(color: Colors.white, fontSize: isNarrow == true ? 8.0 : 14.0),
          ),
        ],
      ),
    );
  }
}
