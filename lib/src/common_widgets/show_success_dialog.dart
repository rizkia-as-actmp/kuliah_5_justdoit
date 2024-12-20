import 'package:flutter/material.dart';
import 'package:justdoit/src/common_widgets/custom_wide_button.dart';
import 'package:justdoit/src/common_widgets/type.dart';
import 'package:justdoit/src/constants/colors.dart';

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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
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
