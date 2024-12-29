import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:justdoit/src/common_widgets/custom_sized_box.dart';
import 'package:justdoit/src/constants/sizes.dart';
import 'package:justdoit/src/features/mark/presentation/editor/custom_mark_toolbar.dart';
import 'package:justdoit/src/features/mark/presentation/editor/mark_editor_text_field.dart';

class MarkEditor extends ConsumerStatefulWidget {
  MarkEditor({
    super.key,
    required this.showToolbar,
    required this.contentController,
  });

  bool showToolbar;
  TextEditingController contentController;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MarkdownEditorState();
}

class _MarkdownEditorState extends ConsumerState<MarkEditor> {
  late FocusScopeNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusScopeNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String hintText = """
# The most documented genocide in history
Smart people are more likely to be biased when faced with data or realities that do not match their political perspective.

> Subjects with higher numerical skills tend to apply their quantitative reasoning selectively, interpreting data in a way that aligns with their political beliefs.

### References
Kahan, D. M., Peters, E., Dawson, E., & Slovic, *Motivated Numeracy and Enlightened Self-Government*.
""";

    //return Expanded(
    //Avoid Using Expanded Inside SingleChildScrollView The Expanded widget expects its parent to have a bounded size, but SingleChildScrollView allows infinite scrolling, which causes layout conflicts.

    return Container(
      padding: EdgeInsets.fromLTRB(DefinedSize.small, 0, DefinedSize.small, 0),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                MarkEditorTextField(
                    editorController: widget.contentController,
                    focusNode: _focusNode,
                    hintText: hintText)
              ],
            ),
          ),
          smallVSizedBox,
          // https://stackoverflow.com/questions/60776811/how-to-make-a-widget-just-stick-to-bottom-of-page
          if (widget.showToolbar)
            Align(
              alignment: AlignmentDirectional.bottomStart,
              child: CustomMarkToolbar(
                editorController: widget.contentController,
                focusNode: _focusNode,
              ),
            ),
          if (widget.showToolbar) smallVSizedBox
        ],
      ),
    );
  }
}
