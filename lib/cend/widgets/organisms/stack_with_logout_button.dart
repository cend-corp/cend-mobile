import 'package:cend/cend/widgets/atoms/logout_button.dart';
import 'package:flutter/material.dart';

class StackWithLogoutButton extends StatelessWidget {
  final Widget child;

  const StackWithLogoutButton({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        children: [
          child,
          const Positioned(
            right: 10,
            bottom: 10,
            child: LogoutButton(),
          ),
        ],
      ),
    );
  }
}
