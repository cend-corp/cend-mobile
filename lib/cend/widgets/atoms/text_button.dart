import 'package:flutter/material.dart';

class CendTextButton extends StatelessWidget {
  final Color background;
  final Color accent;
  final String text;
  final VoidCallback? onClick;

  const CendTextButton(
      {Key? key,
        required this.background,
        required this.accent,
        required this.text,
        required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: background,
          elevation: 0,
        ),
        onPressed: onClick,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            color: accent,
          ),
        ),
      ),
    );
  }
}
