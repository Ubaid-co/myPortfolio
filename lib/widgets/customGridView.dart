// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/textStyle.dart';

import '../utils/colors.dart';
import 'buttons.dart';

class CustomGrid extends StatefulWidget {
  final bool isNarrow;
  const CustomGrid({super.key, this.isNarrow = false});

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
                                  "assets/innvolv.jpeg",
                                ),
                                if (isHovered1) hoverWidget(190, "InnVolv"),
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
                                  "assets/musicPlayer.png",
                                ),
                                if (isHovered2) hoverWidget(190, "Music App"),
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
                                  "assets/easyScan.png",
                                ),
                                if (isHovered3) hoverWidget(190, "Easy Scanner"),
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
                                  "assets/scanner.png",
                                ),
                                if (isHovered4) hoverWidget(190, "Qr Scanner"),
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
                        "assets/johrh.png",
                      ),
                      if (isHovered5) hoverWidget(400, "Johrh FrontStore"),
                    ])),
              ),
            ],
          ),
          Row(
            children: [
              // Expanded(
              //   flex: 3,
              //   child: MouseRegion(
              //       onEnter: (_) {
              //         setState(() {
              //           isHovered6 = true;
              //         });
              //       },
              //       onExit: (_) {
              //         setState(() {
              //           isHovered6 = false;
              //         });
              //       },
              //       child: Stack(children: [
              //         customContainer(
              //           200,
              //           Colors.orange,
              //           "assets/mobileTemplate.jpg",
              //         ),
              //         if (isHovered6) hoverWidget(190),
              //       ])),
              // ),
              Expanded(
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
                        "assets/skoop.jpeg",
                      ),
                      if (isHovered7) hoverWidget(190, "Skoop Signage"),
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

  Widget hoverWidget(double height, String appName) {
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
                appName,
                style: widget.isNarrow == true ? headingTextStyle.copyWith(color: appWhiteColor, fontSize: 14) : TextStyle(color: Colors.white, fontSize: 24),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Hire me for more apps",
                style: TextStyle(color: Colors.white, fontSize: widget.isNarrow == true ? 8 : 16),
              ),
              SizedBox(
                height: 20,
              ),
              CustomElevatedButton(
                text: "Explore",
                fontSize: widget.isNarrow == true ? 8 : 16,
                textColor: textBlackColor,
                onPressed: () {},
                backgroundColor: appWhiteColor,
                width: widget.isNarrow == true ? 25 : 40,
                height: widget.isNarrow == true ? 25 : 40,
                isPadding: false,
              )
            ],
          ),
        ),
      ),
    );
  }
}

