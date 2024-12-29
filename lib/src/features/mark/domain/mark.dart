import 'package:json_annotation/json_annotation.dart';

part 'mark.g.dart';

@JsonSerializable()
class Mark {
  Mark({
    this.id,
    this.title,
    this.fullContent,
    this.previewContent,
  });

  String? id;
  String? title;
  String? fullContent;
  String? previewContent;

  factory Mark.fromJson(Map<String, dynamic> json) => _$MarkFromJson(json);

  Map<String, dynamic> toJson() => _$MarkToJson(this);
}
