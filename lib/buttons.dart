import 'package:flutter/material.dart';

class MyBtn extends StatelessWidget {
  final color;
  final textColor;
  final String btnText;
  final btnTap;

  MyBtn({
    required this.color,
    required this.textColor,
    required this.btnText,
    required this.btnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(60),
        child: GestureDetector(
          onTap: btnTap,
          child: Container(
            color: color,
            child: Center(
              child: Text(
                btnText,
                style: TextStyle(
                  fontSize: 22,
                  color: textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
