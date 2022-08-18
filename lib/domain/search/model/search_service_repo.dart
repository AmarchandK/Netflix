import 'package:dartz/dartz.dart';
import 'package:netflix/core/failiures/mainfailurs.dart';
import 'package:netflix/domain/search/model/search_resp/search.response.dart';

abstract class SearchService {
  Future<Either<MainFailure, SearchResp>> searchMovies(
      {required String movieQuery});
}
