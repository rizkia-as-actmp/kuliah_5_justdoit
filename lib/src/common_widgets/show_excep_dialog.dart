import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:justdoit/src/common_widgets/custom_sized_box.dart';
import 'package:justdoit/src/common_widgets/custom_wide_button.dart';
import 'package:justdoit/src/common_widgets/type.dart';
import 'package:justdoit/src/constants/colors.dart';
import 'package:justdoit/src/utils/custom_exception.dart';

showExceptionDialog(BuildContext context, error) {
  late CustomExceptionObject customError;
  if (error is CustomException) {
    final errorData = jsonDecode(error.toString()) as Map<String, dynamic>;
    customError = CustomExceptionObject.fromJson(errorData);
  } else {
    customError = CustomExceptionObject(
        userFactor: false,
        id: "739917bb",
        message: 'An error occurred',
        details: error);
  }

  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return _AlertDialog(customError: customError);
    },
  );
}

class _AlertDialog extends StatelessWidget {
  const _AlertDialog({
    super.key,
    required this.customError,
  });

  final CustomExceptionObject customError;

  @override
  Widget build(BuildContext context) {
    String errorMessage = customError.message.toUpperCase();
    if (_isNumber(errorMessage)) {
      errorMessage = _getResponseMessage(errorMessage);
    }

    return AlertDialog(
      backgroundColor: DefinedTheme.errorSurface,
      title: Center(
          child: HeadingThree(
        data: errorMessage,
        color: DefinedTheme.error,
      )),
      content: SingleChildScrollView(
        child: ListBody(
          children: [
            Text(
              customError.id,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 10, color: DefinedTheme.error),
            ),
            smallVSizedBox,
            Text(
              customError.details.toString(),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      contentTextStyle: TextStyle(color: DefinedTheme.black),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      actions: <Widget>[
        CustomWideButton(
          labelText: "Understood",
          backgroundColor: DefinedTheme.error,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

bool _isNumber(String str) {
  return double.tryParse(str) != null;
}

Map<int, String> _responseCodes = {
  200: '200 OK',
  201: '201 Created',
  400: '400 Bad Request',
  401: '401 Unauthorized',
  403: '403 Forbidden',
  404: '404 Not Found',
  500: '500 Internal Server Error',
  502: '502 Bad Gateway',
  503: '503 Service Unavailable',
  504: '504 Gateway Timeout',
};

String _getResponseMessage(String code) {
  return _responseCodes[int.parse(code)] ??
      'Unknown Error'; // Default to 'Unknown Error' if code is not found
}
