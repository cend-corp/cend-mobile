import 'package:flutter/material.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ElevatedButton(
      onPressed: () => {},
      style: ElevatedButton.styleFrom(
        primary: theme.primaryColor,
        padding: const EdgeInsets.all(7),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(Icons.west),
          Text(
            'logout',
            style: TextStyle(fontSize: 20),
          )
        ],
      ),
    );
  }
}
