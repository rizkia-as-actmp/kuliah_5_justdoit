import 'package:flutter/material.dart';

class MarkEditorTextField extends StatelessWidget {
  const MarkEditorTextField({
    super.key,
    required this.editorController,
    required this.focusNode,
    this.hintText,
  });

  final TextEditingController editorController;
  final FocusScopeNode focusNode;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: editorController,
      focusNode: focusNode,
      minLines: 5,
      maxLines: null,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Color(0x00ffffff),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Color(0x00ffffff),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Color(0x00ffffff),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          //borderRadius: BorderRadius.all(Radius.circular(DefinedSize.small)),
          borderSide: BorderSide(
            width: 1,
            color: Color(0x00ffffff),
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Color(0x00ffffff),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Color(0x00ffffff),
          ),
        ),
      ),
    );
  }
}
