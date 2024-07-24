// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/textStyle.dart';

import '../utils/colors.dart';
import 'buttons.dart';

class CustomGrid extends StatefulWidget {
  const CustomGrid({super.key});

  @override
  State<CustomGrid> createState() => _CustomGridState();
}

class _CustomGridState extends State<CustomGrid> {
  Color hoverColor = Colors.orange;
  bool isHovered1 = false;
  bool isHovered2 = false;
  bool isHovered3 = false;
  bool isHovered4 = false;
  bool isHovered5 = false;
  bool isHovered6 = false;
  bool isHovered7 = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 6,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: MouseRegion(
                              onEnter: (_) {
                                setState(() {
                                  isHovered1 = true;
                                });
                              },
                              onExit: (_) {
                                setState(() {
                                  isHovered1 = false;
                                });
                              },
                              child: Stack(children: [
                                customContainer(
                                  200,
                                  Colors.blue,
                                  "assets/mobileTemplate.jpg",
                                ),
                                if (isHovered1) hoverWidget(190),
                              ])),
                        ),
                        Expanded(
                          child: MouseRegion(
                              onEnter: (_) {
                                setState(() {
                                  isHovered2 = true;
                                });
                              },
                              onExit: (_) {
                                setState(() {
                                  isHovered2 = false;
                                });
                              },
                              child: Stack(children: [
                                customContainer(
                                  200,
                                  Colors.green,
                                  "assets/mobileTemplate.jpg",
                                ),
                                if (isHovered2) hoverWidget(190),
                              ])),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: MouseRegion(
                              onEnter: (_) {
                                setState(() {
                                  isHovered3 = true;
                                });
                              },
                              onExit: (_) {
                                setState(() {
                                  isHovered3 = false;
                                });
                              },
                              child: Stack(children: [
                                customContainer(
                                  200,
                                  Colors.blue,
                                  "assets/mobileTemplate.jpg",
                                ),
                                if (isHovered3) hoverWidget(190),
                              ])),
                        ),
                        Expanded(
                          child: MouseRegion(
                              onEnter: (_) {
                                setState(() {
                                  isHovered4 = true;
                                });
                              },
                              onExit: (_) {
                                setState(() {
                                  isHovered4 = false;
                                });
                              },
                              child: Stack(children: [
                                customContainer(
                                  200,
                                  Colors.green,
                                  "assets/mobileTemplate.jpg",
                                ),
                                if (isHovered4) hoverWidget(190),
                              ])),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: MouseRegion(
                    onEnter: (_) {
                      setState(() {
                        isHovered5 = true;
                      });
                    },
                    onExit: (_) {
                      setState(() {
                        isHovered5 = false;
                      });
                    },
                    child: Stack(children: [
                      customContainer(
                        410,
                        Colors.red,
                        "assets/mobileTemplate.jpg",
                      ),
                      if (isHovered5) hoverWidget(400),
                    ])),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: MouseRegion(
                    onEnter: (_) {
                      setState(() {
                        isHovered6 = true;
                      });
                    },
                    onExit: (_) {
                      setState(() {
                        isHovered6 = false;
                      });
                    },
                    child: Stack(children: [
                      customContainer(
                        200,
                        Colors.orange,
                        "assets/mobileTemplate.jpg",
                      ),
                      if (isHovered6) hoverWidget(190),
                    ])),
              ),
              Expanded(
                flex: 6,
                child: MouseRegion(
                  onEnter: (_) {
                    setState(() {
                      isHovered7 = true;
                    });
                  },
                  onExit: (_) {
                    setState(() {
                      isHovered7 = false;
                    });
                  },
                  child: Stack(
                    children: [
                      customContainer(
                        200,
                        Colors.purple,
                        "assets/mobileTemplate.jpg",
                      ),
                      if (isHovered7) hoverWidget(190),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget customContainer(double height, Color color, String imageUrl) {
    return Container(
      height: height,
      width: double.infinity,
      color: color,
      margin: EdgeInsets.all(5.0),
      child: Image.asset(
        imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget hoverWidget(double height) {
    return Positioned.fill(
      child: Container(
        margin: EdgeInsets.all(10),
        height: height,
        color: hoverColor.withOpacity(.8),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Hovered",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Hire me for more apps",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              SizedBox(
                height: 20,
              ),
              CustomElevatedButton(
                text: "Explore",
                textColor: textBlackColor,
                onPressed: () {},
                backgroundColor: appWhiteColor,
                width: 40,
                height: 40,
                isPadding: false,
              )
            ],
          ),
        ),
      ),
    );
  }
}

