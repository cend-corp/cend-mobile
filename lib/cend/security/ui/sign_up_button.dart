import 'package:cend/cend/security/domain/auth_cubit.dart';
import 'package:cend/cend/security/domain/auth_state.dart';
import 'package:cend/cend/widgets/atoms/text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpButton extends StatelessWidget {
  final Color accent;
  final Color background;

  const SignUpButton({
    Key? key,
    required this.accent,
    required this.background,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        final onClick = state is LoadingState || state is ErrorState ? null
            : () => context.read<AuthCubit>().signUp();
        return CendTextButton(
          background: background,
          accent: accent,
          text: 'sign up',
          onClick: onClick,
        );
      },
    );
  }
}
