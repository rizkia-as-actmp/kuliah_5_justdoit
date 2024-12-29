import 'package:flutter/material.dart';
import 'package:justdoit/src/common_widgets/custom_wide_button.dart';
import 'package:justdoit/src/common_widgets/type.dart';
import 'package:justdoit/src/constants/colors.dart';
import 'package:justdoit/src/constants/sizes.dart';

showSuccessDialog({
  required BuildContext context,
  required String title,
  required String content,
}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return _AlertDialog(
        title: title,
        content: content,
      );
    },
  );
}

class _AlertDialog extends StatelessWidget {
  const _AlertDialog({
    required this.title,
    required this.content,
  });

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: DefinedTheme.successBackground,
      title: Center(
          child: HeadingThree(
        data: title,
        color: DefinedTheme.success,
        textAlign: TextAlign.center,
      )),
      content: Text(content),
      contentTextStyle: TextStyle(color: DefinedTheme.black),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DefinedSize.extraSmall)),
      actions: <Widget>[
        CustomWideButton(
          labelText: "Alright",
          backgroundColor: DefinedTheme.success,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
