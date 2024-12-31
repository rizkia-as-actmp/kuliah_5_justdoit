import 'package:justdoit/src/features/mark/application/mark_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'mark_viewer_controller.g.dart';

@riverpod
class MarkViewerController extends _$MarkViewerController {
  @override
  FutureOr<void> build() {}

  Future<bool> deleteMark({required String markId}) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      ref.invalidate(markServiceProvider);
      return await ref
          .read(markServiceProvider.notifier)
          .deleteMark(markId: markId);
    });
    return state.hasError == false;
  }
}
