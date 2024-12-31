import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'mark_editor_change_detector.g.dart';

@riverpod
class ChangeDetector extends _$ChangeDetector {
  @override
  bool build() {
    return false; // jika true berarti terdeteksi perubahan
  }

  String _lastSavedTitle = "Untitled";
  String _lastSavedContent = "";
  String _currentTitle = "";
  String _currentContent = "";

  void onTitleChange({required String value}) {
    _currentTitle = value;
    _dif();
  }

  void onContentChange({required String value}) {
    _currentContent = value;
    _dif();
  }

  void _dif() {
    final isDiff = (_currentTitle != _lastSavedTitle) ||
        (_currentContent != _lastSavedContent);
    state = isDiff;
  }

  void onProgressSaved({required String newTitle, required String newContent}) {
    _lastSavedTitle = newTitle;
    _lastSavedContent = newContent;
    state = false;
  }
}
