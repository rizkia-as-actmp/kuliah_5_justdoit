import 'package:flutter/material.dart';
import 'package:justdoit/src/common_widgets/type.dart';
import 'package:justdoit/src/constants/colors.dart';
import 'package:justdoit/src/utils/color_hsl_settings.dart';

class CustomTextButton extends StatelessWidget {
  final void Function()? onPressed;
  final String labelText;
  final Color labelColor;
  final bool disabled;

  const CustomTextButton({
    super.key,
    required this.labelText,
    this.onPressed,
    this.labelColor = DefinedTheme.onBackground,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    final labelOverlayColor = addColorLightness(labelColor, 0.5);

    return TextButton(
      child: HeadingFour(
        data: labelText,
        color: disabled ? labelOverlayColor : labelColor,
      ),
      onPressed: disabled ? null : onPressed,
    );
  }
}
