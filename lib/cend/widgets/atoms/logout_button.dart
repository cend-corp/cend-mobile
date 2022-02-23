import 'package:cend/cend/security/domain/auth_cubit.dart';
import 'package:cend/cend/security/domain/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return ElevatedButton(
          onPressed: () => context.read<AuthCubit>().logout(),
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
      },
    );
  }
}
