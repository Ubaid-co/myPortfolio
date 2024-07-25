// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/colors.dart';

import '../utils/textStyle.dart';

class ExperienceJourney extends StatelessWidget {
  const ExperienceJourney({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: darkGreenColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 300, vertical: 70),
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
                Text("Employment", style: headingTextStyle.copyWith(color: appWhiteColor,fontSize: 18)),
              ],
            ),
            SizedBox(height: 15),
            Text(
              'My Experience Journey',
              style: TextStyle(color:orangeColor, fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Image.asset('assets/journey.jpg', height: 800,fit: BoxFit.contain,), // Add your image asset here
                ),
                SizedBox(width: 40),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      ExperienceTile(
                        date: 'Present - April 2024',
                        title: 'Flutter Dev at GamesTree',
                        description: 'In my position in the company as a Flutter Developer, I work on different kinds of products like QrCode, BarCode, Location Based App, and Payment Methods.',
                        icon: Icons.work,
                        iconColor: Colors.yellow,
                      ),
                      ExperienceTile(
                        date: 'April 2022 - April 2024',
                        title: 'Junior Flutter Dev at Octek',
                        description: 'As a Junior Flutter Developer at Octek, I actively contributed to the development and maintenance of dynamic mobile applications. I collaborated with senior developers to implement innovative features across multiple platforms.',
                        icon: Icons.work,
                        iconColor: Colors.orange,
                      ),
                      ExperienceTile(
                        date: 'December 2021 - April 2022',
                        title: 'Internship (Flutter) at QuanticSol',
                        description: 'During my Flutter internship at QuanticSol, I honed my skills in cross-platform mobile app development, contributing to various projects that enhanced user experience and functionality.',
                        icon: Icons.work,
                        iconColor: Colors.pink,
                      ),
                      ExperienceTile(
                        date: 'August 2018 - April 2021',
                        title: 'Graphic Designer (Freelancing)',
                        description: 'As a seasoned graphic designer with extensive experience on Fiverr, I specialize in creating visually stunning designs that captivate and engage audiences. My portfolio showcases a diverse range of projects.',
                        icon: Icons.work,
                        iconColor: Colors.purple,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ExperienceTile extends StatelessWidget {
  final String date;
  final String title;
  final String description;
  final IconData icon;
  final Color iconColor;

  ExperienceTile({required this.date, required this.title, required this.description, required this.icon, required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Icon(icon, color: iconColor, size: 32),
              Container(width: 2, height: 120, color: Colors.white24),
            ],
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  date,
                  style: TextStyle(color: Colors.white54, fontSize: 16),
                ),
                SizedBox(height: 4),
                Text(
                  title,
                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(color: Colors.white54, fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}