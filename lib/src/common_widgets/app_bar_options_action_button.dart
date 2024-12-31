import 'package:flutter/material.dart';
import 'package:justdoit/src/constants/colors.dart';

class AppBarOptionsActionButton extends StatelessWidget {
  const AppBarOptionsActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.more_vert,
          color: DefinedTheme.onBackground,
        ));
  }
}
