// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search.response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Search _$SearchFromJson(Map<String, dynamic> json) => Search(
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => SearchResp.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$SearchToJson(Search instance) => <String, dynamic>{
      'results': instance.results,
    };

SearchResp _$SearchRespFromJson(Map<String, dynamic> json) => SearchResp(
      id: json['id'] as int?,
      originalTitle: json['original_title'] as String?,
      posterPath: json['poster_path'] as String?,
    );

Map<String, dynamic> _$SearchRespToJson(SearchResp instance) =>
    <String, dynamic>{
      'id': instance.id,
      'original_title': instance.originalTitle,
      'poster_path': instance.posterPath,
    };
