// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/textStyle.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color? textColor;
  final double borderRadius;
  final EdgeInsets padding;
  final double height;
  final double width;
  final bool isPadding;

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.backgroundColor,
    this.borderRadius = 8.0,
    this.textColor,
    this.height = 50,
    this.width = 320,
    this.isPadding = true,
    this.padding = const EdgeInsets.all(12.0),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: isPadding == true ? const EdgeInsets.symmetric(horizontal: 15.0) : EdgeInsets.zero,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor, minimumSize: Size(width, height), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
        onPressed: onPressed,
        child: Text(text, style: buttonTextStyle.copyWith(color: textColor ?? textWhiteColor)),
      ),
    );
  }
}
