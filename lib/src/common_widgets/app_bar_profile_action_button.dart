import 'package:flutter/material.dart';
import 'package:justdoit/src/constants/colors.dart';

class AppBarProfileActionButton extends StatelessWidget {
  const AppBarProfileActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.account_circle_outlined,
          color: DefinedTheme.onBackground,
        ));
  }
}
