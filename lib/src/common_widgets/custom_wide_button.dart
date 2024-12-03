import 'package:flutter/material.dart';
import 'package:justdoit/src/common_widgets/type.dart';
import 'package:justdoit/src/constants/colors.dart';

class CustomWideButton extends StatelessWidget {
  final void Function()? onSubmit;
  final String labelText;
  final Color backgroundColor;
  final Color foregroundColor;
  final Color borderColor;

  const CustomWideButton({
    super.key,
    required this.labelText,
    this.onSubmit,
    this.backgroundColor = DefinedTheme.secondary,
    this.foregroundColor = Colors.white,
    this.borderColor = DefinedTheme.secondary,
  });

  final double _borderWidth = 2;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(backgroundColor),
              foregroundColor: WidgetStateProperty.all(foregroundColor),
              minimumSize:
                  WidgetStateProperty.all(const Size(double.infinity, 48)),
              side: WidgetStateProperty.all(
                BorderSide(
                  color: borderColor,
                  width: _borderWidth,
                ),
              ),
            ),
            onPressed: onSubmit,
            child: HeadingThree(
              data: labelText,
              color: foregroundColor,
            ),
          ),
        ),
      ],
    );
  }
}
