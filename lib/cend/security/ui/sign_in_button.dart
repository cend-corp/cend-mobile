import 'package:cend/cend/security/domain/auth_cubit.dart';
import 'package:cend/cend/security/domain/auth_state.dart';
import 'package:cend/cend/widgets/atoms/text_button_bordered.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInButton extends StatelessWidget {
  final Color accent;
  final Color background;

  const SignInButton({
    Key? key,
    required this.accent,
    required this.background,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        final onClick = state is LoadingState || state is ErrorState ? null
            : () => context.read<AuthCubit>().signIn();
        return TextButtonBordered(
          background: background,
          accent: accent,
          text: 'sign in',
          onClick: onClick,
        );
      },
    );
  }
}
