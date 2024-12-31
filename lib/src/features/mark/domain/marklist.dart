import 'package:json_annotation/json_annotation.dart';
import 'package:justdoit/src/features/mark/domain/mark.dart';

part 'marklist.g.dart';

@JsonSerializable()
class MarkList {
  MarkList({
    this.items,
    this.page,
    this.perPage,
    this.totalItems,
    this.totalPages,
  });

  List<Mark>? items;
  int? page;
  int? perPage;
  int? totalItems;
  int? totalPages;

  factory MarkList.fromJson(Map<String, dynamic> json) =>
      _$MarkListFromJson(json);

  Map<String, dynamic> toJson() => _$MarkListToJson(this);
}
