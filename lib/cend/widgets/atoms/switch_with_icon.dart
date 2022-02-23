import 'package:flutter/material.dart';

class SwitchWithIcon extends StatelessWidget {
  final bool value;
  final Icon icon;
  final ValueChanged<bool> onChanged;

  const SwitchWithIcon(
      {Key? key,
      required this.value,
      required this.icon,
      required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        Switch(
          value: value,
          onChanged: onChanged,
        )
      ],
    );
  }
}
