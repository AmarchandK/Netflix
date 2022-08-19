import 'package:json_annotation/json_annotation.dart';
import 'package:netflix/core/const_strings.dart';
part 'search.response.g.dart';

@JsonSerializable()
class SearchResp {
  @JsonKey(name: 'results')
  List<SearchResult> results;

  SearchResp({this.results = const []});

  factory SearchResp.fromJson(Map<String, dynamic> json) {
    return _$SearchRespFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchRespToJson(this);
}

@JsonSerializable()
class SearchResult {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'original_title')
  String? originalTitle;

  @JsonKey(name: 'poster_path')
  String? posterPath;
  String get posterImageUrl => '$imageAppendURL$posterPath';
  SearchResult({
    // this.id,
    this.originalTitle,
    this.posterPath,
  });

  factory SearchResult.fromJson(Map<String, dynamic> json) {
    return _$SearchResultFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchResultToJson(this);
}
