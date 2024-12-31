import 'package:justdoit/src/exceptions/custom_exception.dart';
import 'package:justdoit/src/features/authentication/application/auth_providers.dart';
import 'package:justdoit/src/features/mark/application/mark_providers.dart';
import 'package:justdoit/src/features/mark/data/mark_repository.dart';
import 'package:justdoit/src/features/mark/domain/mark.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'mark_service.g.dart';

@riverpod
class MarkService extends _$MarkService {
  @override
  void build() {}

  Future<Mark> createMark(
      {required String title, required String content}) async {
    try {
      final authToken = await ref.read(authProvider.notifier).get();
      final result = await ref
          .read(markRepositoryProvider)
          .createMark(authToken!, title, content);
      await ref.read(marksProvider.notifier).refresh();
      return result;
    } catch (e) {
      if (e is CustomException) rethrow;
      throw CustomException(id: "92898d6e", details: e);
    }
  }

  Future<Mark> updateMark(
      {required String title,
      required String content,
      required String markId}) async {
    try {
      final authToken = await ref.read(authProvider.notifier).get();
      final result = await ref
          .read(markRepositoryProvider)
          .updateMark(authToken!, title, content, markId);

      await ref.read(markDetailProvider(markId: markId).notifier).refresh();
      await ref.read(marksProvider.notifier).refresh();

      return result;
    } catch (e) {
      if (e is CustomException) rethrow;
      throw CustomException(id: "dadf491f", details: e);
    }
  }

  Future<void> deleteMark({required String markId}) async {
    try {
      final authToken = await ref.read(authProvider.notifier).get();
      await ref.read(markRepositoryProvider).deleteMark(authToken!, markId);
      await ref.read(marksProvider.notifier).refresh();
    } catch (e) {
      if (e is CustomException) rethrow;
      throw CustomException(id: "f2e2585f", details: e);
    }
  }
}
