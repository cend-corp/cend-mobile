import 'package:cend/cend/widgets/atoms/text_button.dart';
import 'package:flutter/material.dart';

class TextButtonBordered extends StatelessWidget {
  final Color background;
  final Color accent;
  final String text;
  final VoidCallback? onClick;

  const TextButtonBordered(
      {Key? key,
      required this.background,
      required this.accent,
      required this.text,
      required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: accent,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: CendTextButton(
        background: background,
        accent: accent,
        text: text,
        onClick: onClick,
      ),
    );
  }
}
