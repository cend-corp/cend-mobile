import 'package:cend/cend/security/domain/auth_cubit.dart';
import 'package:cend/cend/security/domain/auth_state.dart';
import 'package:cend/cend/widgets/atoms/generic_input.dart';
import 'package:cend/cend/security/ui/sign_in_button.dart';
import 'package:cend/cend/security/ui/sign_up_button.dart';
import 'package:cend/cend/widgets/atoms/text_with_shadow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthForm extends StatefulWidget {
  final Color accent;
  final Color background;
  final Color placeholderColor;

  const AuthForm(
      {Key? key,
      required this.accent,
      required this.background,
      required this.placeholderColor})
      : super(key: key);

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm>
    with SingleTickerProviderStateMixin {
  final _spyWordController = TextEditingController();
  final _uuidController = TextEditingController();

  late final AnimationController _expandController = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  );

  late final Animation<double> _animation = CurvedAnimation(
    parent: _expandController,
    curve: Curves.ease,
  );

  @override
  Widget build(BuildContext context) {
    // FIXME: 22.02.2022 million rebuilds
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        final authCubit = context.read<AuthCubit>();
        if (state is LoadingState) {
          _spyWordController.text = '';
          _uuidController.text = '';
        }
        if (state is InEditingState) {
          state.authModel.uuidInputExpanded
              ? _expandController.forward()
              : _expandController.reverse();
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Cend",
                  style: TextStyle(
                    fontSize: 30,
                    color: widget.accent,
                  ),
                ),
                const SizedBox(width: 10),
                TextWithShadow(
                  color: widget.accent,
                  backgroundColor: widget.background,
                  text: 'connect',
                ),
              ],
            ),
            const SizedBox(height: 35),
            Column(
              children: [
                GenericInput(
                  controller: _spyWordController,
                  onChange: (str) => authCubit.onSpyWordUpdate(str),
                  backgroundColor: widget.placeholderColor,
                  borderColor: widget.background,
                  hintText: "spy word",
                ),
                const SizedBox(height: 16),
                SizeTransition(
                  sizeFactor: _animation,
                  axis: Axis.horizontal,
                  child: GenericInput(
                    controller: _uuidController,
                    onChange: (str) => authCubit.onUuidUpdate(str),
                    backgroundColor: widget.placeholderColor,
                    borderColor: widget.background,
                    hintText: "uuid",
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SignUpButton(
                  accent: widget.accent,
                  background: widget.background,
                ),
                SignInButton(
                  accent: widget.accent,
                  background: widget.background,
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _expandController.dispose();
    super.dispose();
  }
}
