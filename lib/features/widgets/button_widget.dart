import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double height;
  final double width;
  final Color color;
  final TextStyle textStyle;

  const ButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
    this.height = 50,
    this.width = double.infinity,
    this.color = Colors.blue,
    this.textStyle = const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: onPressed,
        child: Text(text, style: textStyle, textAlign: TextAlign.center),
      ),
    );
  }
}
