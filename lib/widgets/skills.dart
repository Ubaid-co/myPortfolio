// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/skillsBubble.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

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

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
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
          () {},
          darkGreenColor,
          appWhiteColor,
          600,
          600,
          370),
    );
  }

  Widget _buildWideNarrowAboutSection() {
    return Container(
      height: 700,
      color: darkGreenColor,
      child: productContainerWidget(
          "About Me",
          "Unleash Your Creativity",
          "A Flutter Developer based in Pakistan,\nwith 2.5 Years of Experience",
          "I have 2.5 years of experience in Flutter Development. As a mid-level Flutter developer, I bring\nextensive experience in building and deploying robust, performant mobile applications for both\nAndroid, iOS, windows, linux and macos platforms. I have a strong background in Dart \nprogramming language and I am well-versed in Flutter's widgets, animations, and state management \ntechniques. I have also developed proficiency in integrating third-party APIs and services, including \nFirebase, FreshChat, Tamara Payment method, Hyper Pay payment method, Insider, BugFender Firebase \nAnalytics, and RESTful APIs. Additionally, I am adept at implementing and customizing UI designs \nusing Flutter's Material Design and Cupertino widgets, and I am skilled in version control using Git and \ncollaborative development using agile methodologies. With my ability to write clean and maintainable code \nand my dedication to stay up-to-date with the latest trends and best practices in mobile app development,\n I am confident in my ability to contribute to any Flutter project.",
          "assets/mobileTemplate.jpg",
          () {},
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
                SizedBox(
                  width: 20,
                ),
                skillSet()
              ],
            ),
    );
  }

  Widget skillSet() {
    return Column(
      children: [
        skillSetRow("Flutter Development", "90", deepBlackColor, pinkShade, 270),
        SizedBox(
          height: 20,
        ),
        skillSetRow("Graphic Designing", "85", deepBlackColor, blueShade, 230, expanded: true),
        SizedBox(
          height: 20,
        ),
        skillSetRow("UI UX Designing", "55", deepBlackColor, orangeShade, 160, ui: true),
        SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            skillIndicator("Flutter UI", 0.85, Colors.amber, 90),
            skillIndicator("Dart", 0.8, Colors.purple, 85),
            skillIndicator("API Integration", 0.78, Colors.pinkAccent, 83),
            skillIndicator("Payment Integration", 0.7, Colors.blueAccent, 80),
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
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: headingTextStyle.copyWith(color: appWhiteColor, fontSize: 16),
        ),
        SizedBox(
          width: expanded == true
              ? 28
              : ui == true
                  ? 40
                  : 15,
        ),
        skillSetContainer(containerBgColor, containerOverlayColor, width),
        SizedBox(
          width: 25,
        ),
        skillSetBubble(number, containerOverlayColor),
      ],
    );
  }

  Widget skillSetContainer(Color bgColor, overlayColor, double width) {
    return Stack(
      children: [
        Container(
          height: 7,
          width: 300,
          decoration: BoxDecoration(
            color: bgColor,
          ),
        ),
        Container(
          height: 7,
          width: width,
          decoration: BoxDecoration(
            color: overlayColor,
          ),
        )
      ],
    );
  }

  Widget skillSetBubble(String text, Color bgColor) {
    return Center(
      child: SpeechBubble(
        text: text,
        bubbleColor: bgColor, // Customize the color here
        textColor: Colors.white, // Customize the text color here
      ),
    );
  }

  Widget skillIndicator(String skill, double percentage, Color color, int value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 23.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return CircularPercentIndicator(
                radius: 50.0,
                lineWidth: 8.0,
                animation: true,
                percent: percentage * _controller.value,
                center: Text(
                  "${(value * _controller.value).toInt()}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
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
            style: TextStyle(color: Colors.white, fontSize: 14.0),
          ),
        ],
      ),
    );
  }
}
