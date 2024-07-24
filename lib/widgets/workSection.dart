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
  @override
  Widget build(BuildContext context) {
     Color hoverColor = orangeColor;
    bool isHovered = false;
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 270),
        color: lightGreenColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
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
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("My Creative Work", style: headingTextStyle.copyWith(color: orangeColor, fontSize: 36)),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FilterButton(label: 'ALL'),
                          FilterButton(label: 'WEB APP'),
                          FilterButton(label: 'MOBILE APP'),
                          FilterButton(label: 'SAAS APP'),
                          FilterButton(label: 'WIRE FRAME'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
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
                    onPressed: (){},
                    backgroundColor: isHovered == true ? orangeColor : darkGreenColor ?? buttonColor,
                    width: 40,
                    height: 40,
                    isPadding: false,
                    hover: true,
                  ),
                )
              ),
            ],
          ),
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
