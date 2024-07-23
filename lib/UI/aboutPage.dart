// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/textStyle.dart';
import '../widgets/buttons.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

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
          "About Me",
          "Unleash Your Creativity",
          "A Flutter Developer based in Pakistan,\nwith 2.5 Years of Experience",
          "I have 2.5 years of experience in Flutter Development. As a mid-level Flutter developer, I bring\nextensive experience in building and deploying robust, performant mobile applications for both\nAndroid, iOS, windows, linux and macos platforms. I have a strong background in Dart \nprogramming language and I am well-versed in Flutter's widgets, animations, and state management \ntechniques. I have also developed proficiency in integrating third-party APIs and services, including \nFirebase, FreshChat, Tamara Payment method, Hyper Pay payment method, Insider, BugFender Firebase \nAnalytics, and RESTful APIs. Additionally, I am adept at implementing and customizing UI designs \nusing Flutter's Material Design and Cupertino widgets, and I am skilled in version control using Git and \ncollaborative development using agile methodologies. With my ability to write clean and maintainable code \nand my dedication to stay up-to-date with the latest trends and best practices in mobile app development,\n I am confident in my ability to contribute to any Flutter project.",
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
      padding: isNarrow == true ? EdgeInsets.symmetric(vertical: 20, horizontal: 25) : EdgeInsets.symmetric(vertical: 35, horizontal: 40),
      height: height,
      decoration: BoxDecoration(color: color),
      child: isNarrow == false
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
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
                    height: imageHeight,
                    width: imageWidth,
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
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
                        Text(heading1, style: headingTextStyle.copyWith(color: textColor)),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(heading2, style: headingTextStyle.copyWith(color: orangeColor)),
                    SizedBox(
                      height: 20,
                    ),
                    Text(heading3, style: headingTextStyle.copyWith(color: textColor)),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      description,
                      style: descriptionStyle.copyWith(color: textColor),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomElevatedButton(
                      text: "Download CV",
                      textColor: findButtonTextColor ?? textWhiteColor,
                      onPressed: onTap,
                      backgroundColor: findButtonColor ?? buttonColor,
                      width: 40,
                      height: 40,
                      isPadding: false,
                    )
                  ],
                ),
              ],
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
                      backgroundColor: findButtonColor ?? buttonColor,
                      width: 40,
                      height: 40,
                      isPadding: false,
                    )
                  ],
                ),
                SizedBox(
                  width: 20,
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
                    height: imageHeight,
                    width: imageWidth,
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
    );
  }
}
