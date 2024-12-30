import 'package:flutter/material.dart';
import 'package:justdoit/src/common_widgets/type.dart';
import 'package:justdoit/src/constants/colors.dart';
import 'package:justdoit/src/constants/sizes.dart';
import 'package:justdoit/src/utils/color_hsl_settings.dart';

class CustomWideButton extends StatelessWidget {
  final void Function()? onPressed;
  final String labelText;
  final Color backgroundColor;
  final Color foregroundColor;
  final Color borderColor;
  final bool disabled;

  const CustomWideButton({
    super.key,
    required this.labelText,
    this.onPressed,
    this.backgroundColor = DefinedTheme.secondary,
    this.foregroundColor = Colors.white,
    this.borderColor = Colors.transparent,
    this.disabled = false,
  });

  final double _borderWidth = 1;

  @override
  Widget build(BuildContext context) {
    final buttonOverlayCollor = addColorLightness(backgroundColor, -1);
    final disabledBgColor =
        addSaturation(addColorLightness(backgroundColor, -0.2), -0.03);
    final disabledFgColor = addColorLightness(foregroundColor, -0.2);

    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: backgroundColor,
                foregroundColor: foregroundColor,
                disabledBackgroundColor: disabledBgColor,
                disabledForegroundColor: disabledFgColor,
                overlayColor: buttonOverlayCollor,
                minimumSize: const Size(double.infinity, 48),
                side: BorderSide(
                  color: borderColor,
                  width: _borderWidth,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(DefinedSize.extraSmall),
                )),
            onPressed: disabled ? null : onPressed,
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
