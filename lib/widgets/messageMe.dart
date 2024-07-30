// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/colors.dart';

import '../utils/textStyle.dart';
import 'buttons.dart';

class MessageMe extends StatelessWidget {
  const MessageMe({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 600;
        bool isTablet = constraints.maxWidth >= 600 && constraints.maxWidth < 1024;

        return Container(
          color: darkGreenColor,
          padding: EdgeInsets.symmetric(vertical: 40, horizontal: isMobile ? 16 : (isTablet ? 32 : 250)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (isMobile)
                Column(
                  children: _buildContactForm(isMobile),
                )
              else
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildContactForm(isMobile),
                ),
            ],
          ),
        );
      },
    );
  }

  List<Widget> _buildContactForm(bool isMobile) {
    return [
      Flexible(
        flex: isMobile ? 0 : 1,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image.asset(
              //   'assets/logo.png', // Use a dummy logo image path
              //   height: 50,
              // ),
              SizedBox(height: 20),
              Text(
                'Flutter Developer',
                style: TextStyle(
                  color: orangeColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'I always look forward to starting something new and it is my hope to deliver authentic solutions that inspire others.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 20),
              Text(
                '© The Tech Tree 2021 | All Rights Reserved',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
      SizedBox(width: isMobile ? 10 : 10),
      Flexible(
        flex: isMobile ? 0 : 1,
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: isMobile ? 20 : 50,
                    height: isMobile ? 1.5 : 3,
                    decoration: BoxDecoration(
                      color: appWhiteColor,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: isMobile ? 5 : 10,
                    height: isMobile ? 0.5 : 2,
                    decoration: BoxDecoration(
                      color: appWhiteColor,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: isMobile ? 2.5 : 5,
                    height: isMobile ? 2.5 : 5,
                    decoration: BoxDecoration(color: orangeColor, shape: BoxShape.circle),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Any Question?", style: headingTextStyle.copyWith(color: textWhiteColor, fontSize: isMobile ? 16: 20)),
                ],
              ),
              SizedBox(height: 8),
              Text(
                'Drop Me A Line',
                style: TextStyle(
                  color: orangeColor,
                  fontSize: isMobile ? 36: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Name',
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                        ),
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                        ),
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Subject',
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                        ),
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Phone',
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                        ),
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Message',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                ),
                style: TextStyle(color: Colors.white),
                maxLines: 3,
              ),
              SizedBox(height: 20),
              CustomElevatedButton(
                text: "Send Message",
                textColor: textWhiteColor,
                onPressed: (){},
                backgroundColor: orangeColor,
                width: 40,
                height: 40,
                isPadding: false,
                hover: false,
              )
            ],
          ),
        ),
      ),
    ];
  }
}
