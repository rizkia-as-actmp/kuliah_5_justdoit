import 'package:flutter/material.dart';
import 'package:justdoit/src/common_widgets/custom_wide_button.dart';
import 'package:justdoit/src/common_widgets/type.dart';
import 'package:justdoit/src/constants/colors.dart';
import 'package:justdoit/src/constants/sizes.dart';

Future<bool?> showConfirmDialog({
  required BuildContext context,
  required String title,
  Color titleColor = DefinedTheme.black,
  required String content,
  String confirmButtonText = "Confirm",
  Color confirmButtonBg = DefinedTheme.error,
  Color confirmButtonFg = Colors.white,
  String cancelButtonText = "Cancel",
}) {
  return showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return _ConfirmationDialog(
        title: title,
        titleColor: titleColor,
        content: content,
        confirmButtonText: confirmButtonText,
        confirmButtonBg: confirmButtonBg,
        confirmButtonFg: confirmButtonFg,
        cancelButtonText: cancelButtonText,
      );
    },
  );
}

class _ConfirmationDialog extends StatelessWidget {
  const _ConfirmationDialog({
    required this.title,
    required this.titleColor,
    required this.content,
    required this.confirmButtonText,
    required this.confirmButtonBg,
    required this.confirmButtonFg,
    required this.cancelButtonText,
  });

  final String title;
  final Color titleColor;
  final String content;
  final String confirmButtonText;
  final Color confirmButtonBg;
  final Color confirmButtonFg;
  final String cancelButtonText;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: DefinedTheme.surface,
      title: Center(
        child: HeadingThree(
          data: title,
          color: titleColor,
          textAlign: TextAlign.center,
        ),
      ),
      content: Text(content),
      contentTextStyle: TextStyle(color: DefinedTheme.black),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DefinedSize.extraSmall)),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: CustomWideButton(
                labelText: cancelButtonText,
                backgroundColor: DefinedTheme.greyish,
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: CustomWideButton(
                labelText: confirmButtonText,
                backgroundColor: confirmButtonBg,
                foregroundColor: confirmButtonFg,
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
