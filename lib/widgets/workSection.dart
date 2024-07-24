// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart';
import '../utils/textStyle.dart';
import 'buttons.dart';
import 'customGridView.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  int selectedIndex = 0;
  final Color selectedColor = orangeColor;
  int hoveredIndex = -1;
  Color hoverColor = orangeColor;
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 270),
        color: lightGreenColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                  Text("Portfolio", style: headingTextStyle.copyWith(color: appWhiteColor, fontSize: 24)),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("My Creative Work", style: headingTextStyle.copyWith(color: orangeColor, fontSize: 36)),
                  Row(
                    children: [
                      _buildTextButton(
                        0,
                        "All",
                      ),
                      _buildTextButton(
                        1,
                        "Android Apps",
                      ),
                      _buildTextButton(
                        2,
                        "IOS Apps",
                      ),
                      _buildTextButton(
                        3,
                        "Web Apps",
                      ),
                      _buildTextButton(
                        4,
                        "Desktop Apps",
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              CustomGrid(),
              SizedBox(
                height: 30,
              ),
              Center(
                  child: MouseRegion(
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
                  text: "View More",
                  textColor: textWhiteColor,
                  onPressed: () {},
                  backgroundColor: isHovered == true ? orangeColor : darkGreenColor ?? buttonColor,
                  width: 40,
                  height: 40,
                  isPadding: false,
                  hover: true,
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextButton(int index, String text, {GlobalKey? key}) {
    bool isSelected = selectedIndex == index;
    bool isHovered = hoveredIndex == index;

    return MouseRegion(
      onEnter: (_) {
        setState(() {
          hoveredIndex = index;
        });
      },
      onExit: (_) {
        setState(() {
          hoveredIndex = -1;
        });
      },
      child: TextButton(
        onPressed: () {
          setState(() {
            selectedIndex = index;
            // _scrollToSection(key);
          });
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: appBarTextStyle.copyWith(
                color: isSelected
                    ? selectedColor
                    : isHovered
                        ? hoverColor
                        : appWhiteColor,
              ),
            ),
            if (isSelected || isHovered)
              Container(
                margin: const EdgeInsets.only(top: 4.0),
                height: 2.0,
                width: isHovered ? 8.0 : 20,
                color: selectedColor,
              ),
          ],
        ),
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final String label;

  FilterButton({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.green,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      child: Text(label),
    );
  }
}

class PortfolioItem extends StatelessWidget {
  final String imageUrl;

  PortfolioItem({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2 - 32,
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imageUrl),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(16.0),
      ),
    );
  }
}
