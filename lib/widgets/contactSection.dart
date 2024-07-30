// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/widgets/messageMe.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/colors.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            bool isMobile = constraints.maxWidth < 600;
            bool isTablet = constraints.maxWidth >= 600 && constraints.maxWidth < 1024;

            return Container(
              color: lightGreenColor,
              padding: EdgeInsets.symmetric(vertical: 40, horizontal: isMobile ? 16 : (isTablet ? 32 : 64)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Looking to Design Similar Project?',
                    style: TextStyle(
                      color: textWhiteColor,
                      fontSize: isMobile ? 24 : 32,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Contact me on any platform and I will be happy to help you out.',
                    style: TextStyle(
                      color: textWhiteColor,
                      fontSize: isMobile ? 16 : 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40),
                  if (isMobile)
                    Column(
                      children: _buildContactItems(isMobile),
                    )
                  else
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _buildContactItems(isMobile),
                    ),
                ],
              ),
            );
          },
        ),
        MessageMe(),
      ],
    );
  }

  List<Widget> _buildContactItems(bool isMobile) {
    final contactItems = [
      ContactItem(
        icon: Icons.phone,
        label: 'Whatsapp At',
        info: '+92 - 314 - 6506512',
        url: 'whatsapp://send?phone=+923146506512',
      ),
      ContactItem(
        icon: Icons.email,
        label: 'Email At',
        info: 'baidakmal20@gmail.com',
        url: 'mailto:baidakmal20@gmail.com',
      ),
      ContactItem(
        icon: null,
        faIcon: FontAwesomeIcons.facebook,
        label: 'Facebook',
        info: 'ubaidullah.akmal?mibextid=ZbWKwL',
        url: 'https://facebook.com/ubaidullah.akmal?mibextid=ZbWKwL',
      ),
      ContactItem(
        icon: null,
        faIcon: FontAwesomeIcons.instagram,
        label: 'Instagram',
        info: 'ubaidakmal2008',
        url: 'https://instagram.com/ubaidakmal2008',
      ),
      ContactItem(
        icon: null,
        faIcon: FontAwesomeIcons.linkedin,
        label: 'LinkedIn',
        info: 'ubaid-ullah-22921b227?',
        url: 'https://linkedin.com/in/ubaid-ullah-22921b227?',
      ),
    ];

    return contactItems.map((item) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: isMobile ? 0 : 8, vertical: isMobile ? 8 : 0),
        child: item,
      );
    }).toList();
  }
}

class ContactItem extends StatelessWidget {
  final IconData? icon;
  final IconData? faIcon;
  final String label;
  final String info;
  final String url;

  const ContactItem({
    super.key,
    this.icon,
    this.faIcon,
    required this.label,
    required this.info,
    required this.url
  });
  Future<void> _launchURL() async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _launchURL,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: darkGreenColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            icon == null ? FaIcon(faIcon, color: Colors.orange, size: 32) : Icon(icon, color: Colors.orange, size: 32),
            SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(height: 4),
            Text(
              info,
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
