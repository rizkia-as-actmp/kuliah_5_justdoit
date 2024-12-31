import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:justdoit/src/common_widgets/custom_app_bar.dart';
import 'package:justdoit/src/common_widgets/custom_sized_box.dart';
import 'package:justdoit/src/features/mark/presentation/editor/mark_editor_change_detector.dart';

class MarkEditorAppBar extends ConsumerWidget implements PreferredSizeWidget {
  MarkEditorAppBar({
    required this.titleController,
    required this.toggleHideToolbar,
    required this.markId,
    this.onSave,
    this.onBack,
    this.onPreview,
  });

  final TextEditingController titleController;
  VoidCallback? toggleHideToolbar;
  VoidCallback? onSave;
  VoidCallback? onBack;
  VoidCallback? onPreview;
  final String? markId;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isValueChange = ref.watch(changeDetectorProvider);
    return CustomAppBar(
      leftRowWidgets: [
        IconButton(
          onPressed: onBack,
          icon: const Icon(Icons.arrow_back_outlined),
        ),
      ],
      middleRowWidgets: [
        SizedBox(
          width: 100,
          child: TextField(
            controller: titleController,
            textAlign: TextAlign.end,
            decoration: const InputDecoration(border: InputBorder.none),
          ),
        ),
        extraSmallVSizedBox,
        if (isValueChange) Text("*"),
      ],
      rightRowWidgets: [
        IconButton(
          onPressed: toggleHideToolbar,
          icon: const Icon(Icons.construction_outlined),
        ),
        mediumHSizedBox,
        IconButton(
          onPressed: (isValueChange) ? onSave : null,
          icon: (markId == null)
              ? Icon(Icons.note_add_outlined)
              : Icon(Icons.save_outlined),
        ),
        mediumHSizedBox,
        IconButton(
          onPressed: onPreview,
          icon: const Icon(Icons.play_arrow_outlined),
        ),
      ],
    );
  }
}
