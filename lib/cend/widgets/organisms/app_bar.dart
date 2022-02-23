import 'package:flutter/material.dart';

class CendAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? actions;

  const CendAppBar({
    Key? key,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return BlocBuilder<AppPropsCubit, AppPropsState>(
    //   builder: (context, state) {
    return AppBar(
      leading: Image.asset('assets/images/logo.jpeg'),
      // title: Text(AppLocalizations.of(context)!.title),
      title: const Text(
        "Title",
        style: TextStyle(fontSize: 26),
      ),
      actions: [...?actions],
    );
    // },
    // );
  }

  @override
  Size get preferredSize => const Size.fromHeight(40.0);
}
