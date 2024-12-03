import 'package:flutter/material.dart';
import 'package:justdoit/src/common_widgets/type.dart';
import 'package:justdoit/src/constants/colors.dart';

class CustomTextButton extends StatelessWidget {
  final String labelText;
  final Color labelColor;

  const CustomTextButton(
      {super.key,
      required this.labelText,
      this.labelColor = DefinedTheme.onBackground});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: HeadingFour(
        data: labelText,
        color: labelColor,
      ),
      onPressed: () {},
    );
  }
}
