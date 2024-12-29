import 'package:justdoit/src/features/mark/application/mark_service.dart';
import 'package:justdoit/src/features/mark/domain/mark.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'mark_editor_controller.g.dart';

@riverpod
class MarkEditorController extends _$MarkEditorController {
  @override
  FutureOr<Mark?> build() {}

  Future<Mark?> onCreateNew(
      {required String title, required String content}) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return await ref
          .read(markServiceProvider.notifier)
          .createMark(title: title, content: content);
    });
    return state.value;
  }

  Future<Mark?> onUpdate(
      {required String title,
      required String content,
      required String markId}) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return await ref
          .read(markServiceProvider.notifier)
          .updateMark(title: title, content: content, markId: markId);
    });
    return state.value;
  }
}
