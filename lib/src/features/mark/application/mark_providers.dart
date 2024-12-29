import 'package:justdoit/src/exceptions/custom_exception.dart';
import 'package:justdoit/src/features/mark/data/mark_repository.dart';
import 'package:justdoit/src/features/mark/domain/mark.dart';
import 'package:justdoit/src/features/mark/domain/marklist.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'mark_providers.g.dart';

@riverpod
class MarkDetail extends _$MarkDetail {
  @override
  Future<Mark> build({required String markId}) async {
    return await _fetch(markId: markId);
  }

  Future<Mark?> refresh() async {
    try {
      // penjelasan kenapa ini tidak pakai _fetchMarkList ada sama seperti kasus setAuth pada authProviders
      final markDetail =
          await ref.read(markRepositoryProvider).getDetail(markId);

      state = AsyncValue.data(markDetail);
      return state.value;
    } catch (e) {
      if (e is CustomException) rethrow;
      throw CustomException(id: "92afbcc0", details: e);
    }
  }

  Future<Mark> _fetch({required String markId}) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final markDetail =
          await ref.read(markRepositoryProvider).getDetail(markId);
      return markDetail;
    });
    return state.value!;
  }
}

@riverpod
class Marks extends _$Marks {
  @override
  Future<MarkList?> build() async {
    _fetch();
  }

  MarkList? get() {
    return state.value;
  }

  Future<MarkList?> refresh() async {
    try {
      final markList = await ref.read(markRepositoryProvider).getList();

      state = AsyncValue.data(markList);
      return state.value;
    } catch (e) {
      if (e is CustomException) rethrow;
      throw CustomException(id: "fe4d5452", details: e);
    }
  }

  Future<MarkList?> _fetch() async {
    state = const AsyncValue.loading();
    final result = await AsyncValue.guard(() async {
      final markList = await ref.read(markRepositoryProvider).getList();
      return markList;
    });

    state = result;
    return result.value;
  }
}
