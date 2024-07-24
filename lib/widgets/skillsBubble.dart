// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class SpeechBubble extends StatelessWidget {
  final String text;
  final Color bubbleColor;
  final Color textColor;

  // ignore: use_key_in_widget_constructors
  SpeechBubble({required this.text, required this.bubbleColor, required this.textColor});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: BubblePainter(bubbleColor: bubbleColor),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Text(
          text,
          style: TextStyle(color: textColor, fontSize: 16),
        ),
      ),
    );
  }
}

class BubblePainter extends CustomPainter {
  final Color bubbleColor;

  BubblePainter({required this.bubbleColor});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = bubbleColor;
    final rect = Rect.fromLTRB(0, 0, size.width, size.height);
    final bubbleRRect = RRect.fromRectAndRadius(rect, Radius.circular(5));

    canvas.drawRRect(bubbleRRect, paint);

    final arrowPath = Path()
      ..moveTo(0, size.height / 2 - 5)
      ..lineTo(-10, size.height / 2)
      ..lineTo(0, size.height / 2 + 5)
      ..close();

    canvas.drawPath(arrowPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
