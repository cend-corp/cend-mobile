import 'package:flutter/material.dart';

class RightPopup extends StatelessWidget {
  final VoidCallback? onPressed;
  final String message;
  final bool expanded;

  const RightPopup(
      {Key? key, this.onPressed, required this.message, required this.expanded})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      top: 10,
      right: expanded ? 10 : -310,
      duration: const Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white12,
          border: Border.all(color: Colors.white12),
          borderRadius: const BorderRadius.all(Radius.circular(6)),
        ),
        width: 200,
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            message,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
