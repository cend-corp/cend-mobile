import 'package:cend/cend/security/domain/auth_cubit.dart';
import 'package:cend/cend/security/domain/auth_state.dart';
import 'package:cend/cend/security/ui/auth_form.dart';
import 'package:cend/cend/widgets/atoms/right_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const back = Color.fromRGBO(33, 33, 33, 1);
    const accent = Color.fromRGBO(4, 232, 177, 1);
    const placeholderColor = Color.fromRGBO(255, 255, 255, 0.5);

    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        // if (state is LoadingState) return const FullscreenLoading();
        if (state is SuccessfulState) {
          // TODO: 23.02.2022
        }
        late final Widget popup = _makePopup(state, context);

        return Stack(
          children: [
            Container(
              height: double.infinity,
              color: back,
              child: const Center(
                child: SingleChildScrollView(
                  child: AuthForm(
                    accent: accent,
                    background: back,
                    placeholderColor: placeholderColor,
                  ),
                ),
              ),
            ),
            popup,
          ],
        );
      },
    );
  }

  RightPopup _makePopup(AuthState state, BuildContext context) {
    if (state is ErrorState) {
      Future.delayed(const Duration(seconds: 4),
          () => context.read<AuthCubit>().hideErrorPopup());
      return RightPopup(
        message: state.message ?? '',
        expanded: state.authModel.errorPopupShowed,
        onPressed: () => context.read<AuthCubit>().hideErrorPopup(),
      );
    } else {
      return RightPopup(
        message: '',
        expanded: false,
        onPressed: () => {},
      );
    }
  }
}
