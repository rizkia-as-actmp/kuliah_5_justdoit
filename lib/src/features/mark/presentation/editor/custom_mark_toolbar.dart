import 'package:flutter/material.dart';
import 'package:justdoit/src/constants/colors.dart';
import 'package:justdoit/src/constants/sizes.dart';
import 'package:markdown_toolbar/markdown_toolbar.dart';

class CustomMarkToolbar extends StatelessWidget {
  const CustomMarkToolbar({
    super.key,
    required this.editorController,
    required this.focusNode,
  });

  final TextEditingController editorController;
  final FocusScopeNode focusNode;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MarkdownToolbar(
        backgroundColor: DefinedTheme.primary,
        iconColor: DefinedTheme.onPrimary,
        dropdownTextColor: DefinedTheme.onBackground,
        borderRadius: BorderRadius.all(Radius.circular(DefinedSize.extraSmall)),
        alignment: WrapAlignment.start,
        collapsable: false,
        useIncludedTextField: false,
        controller: editorController,
        focusNode: focusNode,
      ),
    );
  }
}
