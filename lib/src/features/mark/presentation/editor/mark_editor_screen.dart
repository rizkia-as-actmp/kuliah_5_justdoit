import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:justdoit/src/common_widgets/loading_screen.dart';
import 'package:justdoit/src/common_widgets/show_confirm_dialog.dart';
import 'package:justdoit/src/common_widgets/show_excep_dialog.dart';
import 'package:justdoit/src/constants/colors.dart';
import 'package:justdoit/src/features/mark/application/mark_providers.dart';
import 'package:justdoit/src/features/mark/domain/mark.dart';
import 'package:justdoit/src/features/mark/presentation/editor/mark_editor_app_bar.dart';
import 'package:justdoit/src/features/mark/presentation/editor/mark_editor.dart';
import 'package:justdoit/src/features/mark/presentation/editor/mark_editor_change_detector.dart';
import 'package:justdoit/src/features/mark/presentation/editor/mark_editor_controller.dart';
import 'package:justdoit/src/features/mark/presentation/editor/viewer/mark_previewer_screen.dart';

class MarkEditorScreen extends ConsumerWidget {
  const MarkEditorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final passedArguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>?;

    if (passedArguments == null || passedArguments['markId'] == null) {
      return _MarkEditorBody();
    }

    final markId = passedArguments['markId']!;
    final markState = ref.watch(markDetailProvider(markId: markId));

    return markState.when(
      data: (mark) => _MarkEditorBody(mark: mark),
      loading: () => const LoadingScreen(),
      error: (error, _) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          showExceptionDialog(context, error);
        });
        return Scaffold(
          appBar: AppBar(title: const Text("Error")),
          body: const Center(
            child: Text("Failed to load mark details."),
          ),
        );
      },
    );
  }
}

class _MarkEditorBody extends ConsumerStatefulWidget {
  const _MarkEditorBody({this.mark});

  final Mark? mark;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MarkEditorBodyState();
}

class _MarkEditorBodyState extends ConsumerState<_MarkEditorBody> {
  bool _showToolbar = true;
  String? markId;

  late final TextEditingController _titleController =
      TextEditingController(text: widget.mark?.title ?? "Untitled");
  String get _title => _titleController.text;

  late final TextEditingController _contentController =
      TextEditingController(text: widget.mark?.fullContent ?? "");
  String get _content => _contentController.text;

  @override
  void initState() {
    super.initState();
    markId = widget.mark?.id;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // menggunakan WidgetsBinding.instance.addPostFrameCallback memastikan widget telah dibuild sebelum melakukan aksi pada callbackny
      ref
          .read(changeDetectorProvider.notifier)
          .onProgressSaved(newTitle: _title, newContent: _content);
    });
    _contentController.addListener(() {
      ref
          .read(changeDetectorProvider.notifier)
          .onContentChange(value: _content);
    });
    _titleController.addListener(() {
      ref.read(changeDetectorProvider.notifier).onTitleChange(value: _title);
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  void onCreateNew() async {
    final Mark? newMark = await ref
        .read(markEditorControllerProvider.notifier)
        .onCreateNew(title: _title, content: _content);

    if (newMark != null) {
      setState(() {
        markId = newMark.id;
      });

      ref.read(changeDetectorProvider.notifier).onProgressSaved(
          newTitle: newMark.title!, newContent: newMark.fullContent!);
    }
  }

  void onUpdate() async {
    final Mark? newMark = await ref
        .read(markEditorControllerProvider.notifier)
        .onUpdate(title: _title, content: _content, markId: markId!);

    if (newMark != null) {
      ref.read(changeDetectorProvider.notifier).onProgressSaved(
          newTitle: newMark.title!, newContent: newMark.fullContent!);
    }
  }

  void onBackEvent() async {
    final isValueChange = ref.read(changeDetectorProvider);

    if (isValueChange) {
      final bool? result = await showConfirmDialog(
        context: context,
        title: "Quit Editing",
        content:
            "You have unsaved changes. Are you sure you want to quit without saving?",
        confirmButtonBg: DefinedTheme.error,
      );

      if (result == false) return;
    }

    (markId != null)
        ? Navigator.pushReplacementNamed(context, '/markdown-viewer',
            arguments: {'markId': markId!})
        : Navigator.pop(context);
  }

  void onPreview() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MarkPreviewerScreen(
          title: _title,
          content: _content,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(markEditorControllerProvider);

    // Check for AsyncError state and show dialog using a side effect
    if (state is AsyncError) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showExceptionDialog(context, state.error);
        ref.invalidate(
            markEditorControllerProvider); // klo gada ini terkadang asyncerror akan muncul lagi sehingga dialog tidak bisa hilang
      });
    }

    return Scaffold(
      appBar: MarkEditorAppBar(
        titleController: _titleController,
        toggleHideToolbar: () {
          setState(() {
            _showToolbar = !_showToolbar;
          });
        },
        onSave: (markId != null) ? onUpdate : onCreateNew,
        onBack: onBackEvent,
        onPreview: onPreview,
        markId: markId,
      ),
      body: MarkEditor(
        showToolbar: _showToolbar,
        contentController: _contentController,
      ),
    );
  }
}
