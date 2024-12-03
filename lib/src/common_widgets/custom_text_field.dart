import 'package:flutter/material.dart';
import 'package:justdoit/src/common_widgets/custom_sized_box.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.labelText,
  });

  String? fieldValidator(dynamic value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    // NOTE: If there are no errors, the validator must return null.
    return null;
  }

  final double _borderWidth = 3;
  final BorderRadius _borderRadius =
      const BorderRadius.all(Radius.circular(10));
  final Color _borderColor = const Color(0xFF314748);
  final Color _enabledBorderColor = const Color(0xFF314748);
  final Color _errorBorderColor = const Color(0xFF314748);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText),
        smallVSizedBox,
        TextFormField(
          autofocus: true,
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: _borderRadius,
              borderSide: BorderSide(
                width: _borderWidth,
                color: _borderColor,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: _borderRadius,
              borderSide: BorderSide(
                width: _borderWidth,
                color: _enabledBorderColor,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: _borderRadius,
              borderSide: BorderSide(
                width: _borderWidth,
                color: _errorBorderColor,
              ),
            ),
            hintText: hintText,
          ),
          validator: fieldValidator,
        ),
      ],
    );
  }
}
