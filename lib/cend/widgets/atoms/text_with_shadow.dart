import 'package:flutter/material.dart';

class TextWithShadow extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  final String text;

  const TextWithShadow(
      {Key? key,
      required this.color,
      required this.backgroundColor,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 3,
        horizontal: 8,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: color,
            blurRadius: 3,
            spreadRadius: 3,
          ),
        ],
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 30,
          color: color,
        ),
      ),
    );
  }
}
