import 'package:flutter/material.dart';

class LeftRow extends StatelessWidget {
  final List<Widget>? children;

  const LeftRow({Key? key, this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [...?children],
    );
  }
}
