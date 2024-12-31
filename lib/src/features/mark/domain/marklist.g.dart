// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marklist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarkList _$MarkListFromJson(Map<String, dynamic> json) => MarkList(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Mark.fromJson(e as Map<String, dynamic>))
          .toList(),
      page: (json['page'] as num?)?.toInt(),
      perPage: (json['perPage'] as num?)?.toInt(),
      totalItems: (json['totalItems'] as num?)?.toInt(),
      totalPages: (json['totalPages'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MarkListToJson(MarkList instance) => <String, dynamic>{
      'items': instance.items,
      'page': instance.page,
      'perPage': instance.perPage,
      'totalItems': instance.totalItems,
      'totalPages': instance.totalPages,
    };
