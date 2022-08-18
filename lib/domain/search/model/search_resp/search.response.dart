import 'package:json_annotation/json_annotation.dart';
import 'package:netflix/core/const_strings.dart';
part 'search.response.g.dart';

@JsonSerializable()
class Search {
  @JsonKey(name: 'results')
  List<SearchResp> results;

  Search({this.results = const []});

  factory Search.fromJson(Map<String, dynamic> json) {
    return _$SearchFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchToJson(this);
}

@JsonSerializable()
class SearchResp {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'original_title')
  String? originalTitle;

  @JsonKey(name: 'poster_path')
  String? posterPath;
  SearchResp({
    this.id,
    this.originalTitle,
    this.posterPath,
  });

  factory SearchResp.fromJson(Map<String, dynamic> json) {
    return _$SearchRespFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchRespToJson(this);
}
