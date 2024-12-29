import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:justdoit/src/common_widgets/custom_app_bar.dart';
import 'package:justdoit/src/common_widgets/custom_sized_box.dart';
import 'package:justdoit/src/common_widgets/type.dart';

class MarkPreviewerScreen extends StatelessWidget {
  const MarkPreviewerScreen({
    super.key,
    required this.title,
    required this.content,
  });

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        automaticallyImplyLeading: true,
        middleRowWidgets: [
          HeadingFour(data: "Preview: $title"),
        ],
        rightRowWidgets: [
          mediumHSizedBox,
        ],
      ),
      body: Markdown(
        data: content,
      ),
    );
  }
}
