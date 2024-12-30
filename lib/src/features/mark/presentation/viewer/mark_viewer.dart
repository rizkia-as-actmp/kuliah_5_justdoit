import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:justdoit/src/common_widgets/custom_app_bar.dart';
import 'package:justdoit/src/common_widgets/custom_sized_box.dart';
import 'package:justdoit/src/common_widgets/loading_screen.dart';
import 'package:justdoit/src/common_widgets/show_confirm_dialog.dart';
import 'package:justdoit/src/common_widgets/show_excep_dialog.dart';
import 'package:justdoit/src/common_widgets/type.dart';
import 'package:justdoit/src/constants/colors.dart';
import 'package:justdoit/src/features/mark/application/mark_providers.dart';
import 'package:justdoit/src/features/mark/domain/mark.dart';
import 'package:justdoit/src/features/mark/presentation/viewer/mark_viewer_controller.dart';

class MarkViewerScreen extends ConsumerWidget {
  const MarkViewerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final passedArguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>?;

    if (passedArguments == null || passedArguments['markId'] == null) {
      return Scaffold(
        appBar: AppBar(title: const Text("Error")),
        body: const Center(
          child: Text("Mark ID is missing"),
        ),
      );
    }

    final markId = passedArguments['markId']!;
    final markState = ref.watch(markDetailProvider(markId: markId));

    return markState.when(
      data: (mark) => _MarkViewerBody(mark: mark),
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

class _MarkViewerBody extends ConsumerStatefulWidget {
  const _MarkViewerBody({
    super.key,
    required this.mark,
  });

  final Mark mark;

  @override
  ConsumerState<_MarkViewerBody> createState() => _MarkViewerBodyState();
}

class _MarkViewerBodyState extends ConsumerState<_MarkViewerBody> {
  void _onDelete() async {
    final bool? result = await showConfirmDialog(
        context: context,
        title: "Delete Mark",
        content: "Are you sure you want to delete this mark?",
        confirmButtonBg: DefinedTheme.error);

    if (result == false) return;

    final success = await ref
        .read(markViewerControllerProvider.notifier)
        .deleteMark(markId: widget.mark.id!);
    if (success) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    // somehow this checking is for asyncError and showExceptionDialog will prevent from bad state error
    final state = ref.watch(markViewerControllerProvider);
    if (state is AsyncError) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showExceptionDialog(context, state.error);
        ref.invalidate(markViewerControllerProvider);
      });
    }

    return Scaffold(
      appBar: CustomAppBar(
        leftRowWidgets: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_outlined))
        ],
        middleRowWidgets: [
          HeadingFour(data: widget.mark.title!),
        ],
        rightRowWidgets: [
          IconButton(
              onPressed: () {}, icon: Icon(Icons.picture_as_pdf_outlined)),
          mediumHSizedBox,
          IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/mark-editor',
                    arguments: {'markId': widget.mark.id!});
              },
              icon: Icon(Icons.edit_outlined)),
          mediumHSizedBox,
          IconButton(onPressed: _onDelete, icon: Icon(Icons.delete_outline))
        ],
      ),
      body: Markdown(
        data: widget.mark.fullContent!,
      ),
    );
  }
}
