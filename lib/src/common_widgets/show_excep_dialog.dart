import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:justdoit/src/common_widgets/custom_sized_box.dart';
import 'package:justdoit/src/common_widgets/custom_wide_button.dart';
import 'package:justdoit/src/common_widgets/type.dart';
import 'package:justdoit/src/constants/colors.dart';
import 'package:justdoit/src/constants/sizes.dart';
import 'package:justdoit/src/exceptions/custom_exception.dart';

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
  const _AlertDialog({required this.customError});

  final CustomExceptionObject customError;

  @override
  Widget build(BuildContext context) {
    String errorMessage = customError.message.toUpperCase();
    String errorHttpResponseCode =
        _handleErrorHttpResponseCodeNullable(customError.httpResponseCode);

    late String customErrorDetails;
    try {
      customErrorDetails =
          _formatJson(customError.details as Map<String, dynamic>);
    } catch (_) {
      customErrorDetails = customError.details.toString();
    }

    return AlertDialog(
      backgroundColor: DefinedTheme.errorBackground,
      title: Center(
          child: HeadingThree(
        data: errorMessage,
        color: DefinedTheme.error,
        textAlign: TextAlign.center,
      )),
      content: SingleChildScrollView(
        child: ListBody(
          children: [
            customError.httpResponseCode != null
                ? Center(
                    child: Column(
                      children: [
                        HeadingFive(
                            data: errorHttpResponseCode,
                            color: DefinedTheme.error),
                        extraSmallVSizedBox,
                        Text(
                          customError.id,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 10, color: DefinedTheme.error),
                        ),
                      ],
                    ),
                  )
                : Text(
                    customError.id,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 10, color: DefinedTheme.error),
                  ),
            smallVSizedBox,
            customErrorDetails.isEmpty
                ? extraSmallVSizedBox
                : Container(
                    //color: DefinedTheme.errorSurface, // tidak bisa pakai color klo pakai decoration box decoration
                    padding: EdgeInsets.all(DefinedSize.extraSmall),
                    decoration: BoxDecoration(
                      color: DefinedTheme.errorSurface,
                      border: Border.all(color: DefinedTheme.greyish, width: 1),
                      borderRadius:
                          BorderRadius.circular(DefinedSize.extraSmall),
                    ),
                    child: Text(customErrorDetails),
                  ),
          ],
        ),
      ),
      contentTextStyle: TextStyle(color: DefinedTheme.black),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      actions: <Widget>[
        CustomWideButton(
          labelText: "Dismiss",
          backgroundColor: DefinedTheme.error,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

String _handleErrorHttpResponseCodeNullable(String? errorHttpResponseCode) {
  // cek apakah  errorHttpResponseCode null atau tidak, baru cek _isNumber karna _isNumber hanya menerima String non nullable, pengecekan diawal memastikan nilai tidak null
  if (errorHttpResponseCode != null && _isNumber(errorHttpResponseCode)) {
    return _getResponseMessage(errorHttpResponseCode);
  } else {
    return "";
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
  return _responseCodes[int.parse(code)] ?? 'Unknown Error';
}

String _formatJson(dynamic json, {int indent = 0}) {
  const String indentUnit = '  '; // Indentation unit
  final String currentIndent = indentUnit * indent;
  if (json is Map<String, dynamic>) {
    // Iterate through Map and format recursively
    return json.entries.map((entry) {
      final key = entry.key;
      final value = entry.value;

      if (value is Map || value is List) {
        return '$currentIndent$key:\n${_formatJson(value, indent: indent + 1)}\n';
      } else {
        return '$currentIndent$key: $value';
      }
    }).join('\n');
  } else if (json is List) {
    // Handle Lists and format recursively
    return json.map((value) {
      if (value is Map || value is List) {
        return _formatJson(value, indent: indent + 1);
      } else {
        return '$currentIndent- $value';
      }
    }).join('\n');
  } else if (json != null) {
    // Default case for primitive types
    return '$currentIndent$json';
  } else {
    return '$currentIndent(null)';
  }
}
