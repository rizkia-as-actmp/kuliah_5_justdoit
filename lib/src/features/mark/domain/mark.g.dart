// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mark.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mark _$MarkFromJson(Map<String, dynamic> json) => Mark(
      id: json['id'] as String?,
      title: json['title'] as String?,
      fullContent: json['fullContent'] as String?,
      previewContent: json['previewContent'] as String?,
    );

Map<String, dynamic> _$MarkToJson(Mark instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'fullContent': instance.fullContent,
      'previewContent': instance.previewContent,
    };
