// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/colors.dart';
import 'package:http/http.dart' as http;
import '../utils/textStyle.dart';
import 'buttons.dart';
import 'package:emailjs/emailjs.dart' as emailjs;

class MessageMe extends StatefulWidget {
  const MessageMe({super.key});

  @override
  State<MessageMe> createState() => _MessageMeState();
}

class _MessageMeState extends State<MessageMe> {
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  Future<void> sendEmail() async {
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    const serviceId = 'service_9le52tj';
    const templateId = 'template_6e8ysz4';
    const userId = 'QzslCt13bKp5Yo8Mv';
    final response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(
          {
            'service_id': serviceId,
            'template_id': templateId,
            'user_id': userId,
            'template_params': {
              'user_name': nameController.text,
              'user_email': emailController.text,
              'user_subject': subjectController.text,
              'user_message': "Phone Number : - \n${phoneController.text}\n${messageController.text}",
            }
          },
        ));

    if (response.statusCode == 200 && mounted) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Message sent successfully!')),
      );
    } else {
      setState(() {
        isLoading = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to send message. Please try again.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 600;
        bool isTablet = constraints.maxWidth >= 600 && constraints.maxWidth < 1024;

        return Form(
          key: _formKey,
          child: Container(
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
              Image.asset(
                'assets/UD.png', // Use a dummy logo image path
                height: isMobile ? 50 : 120,
              ),
              SizedBox(
                height: 10,
              ),
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
                  Text("Any Question?", style: headingTextStyle.copyWith(color: textWhiteColor, fontSize: isMobile ? 12 : 16)),
                ],
              ),
              SizedBox(height: 8),
              Text(
                'Drop Me A Line',
                style: TextStyle(
                  color: orangeColor,
                  fontSize: isMobile ? 22 : 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: nameController,
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: emailController,
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        } else if (!EmailValidator.validate(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: subjectController,
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the subject';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: phoneController,
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: messageController,
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your message';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              isLoading
                  ? CircularProgressIndicator(
                      color: textWhiteColor,
                    )
                  : CustomElevatedButton(
                      text: "Send Message",
                      textColor: textWhiteColor,
                      onPressed: () {
                        setState(() {
                          isLoading = true;
                        });
                        if (_formKey.currentState!.validate()) {
                          sendEmail().then((_) {
                            nameController.clear();
                            emailController.clear();
                            subjectController.clear();
                            phoneController.clear();
                            messageController.clear();
                          });
                        } else {
                          setState(() {
                            isLoading = false;
                          });
                        }
                      },
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
