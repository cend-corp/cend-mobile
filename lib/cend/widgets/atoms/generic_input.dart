import 'package:flutter/material.dart';

class GenericInput extends StatelessWidget {
  final Color backgroundColor;
  final Color borderColor;
  final String hintText;
  final ValueChanged<String> onChange;
  final TextEditingController controller;

  const GenericInput({Key? key,
    required this.backgroundColor,
    required this.borderColor,
    required this.hintText, required this.onChange, required this.controller,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 40,
      child: Container(
        decoration: BoxDecoration(
          color: borderColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 17),
          child: TextField(
            controller:controller,
            onChanged: onChange,
            style: TextStyle(
              color: backgroundColor,
              fontSize: 18,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
            ),
          ),
        ),
      ),
    );
  }
}
