// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/core/failiures/mainfailurs.dart';
import 'package:netflix/domain/downloads/i_downloads_repo.dart';
import 'package:netflix/domain/search/model/search_service_repo.dart';

import '../../domain/downloads/models/downloads.dart';
import '../../domain/search/model/search_resp/search.response.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IDownloadsRepo _downloadService;
  final SearchService _searchService;
  SearchBloc(this._downloadService, this._searchService)
      : super(SearchState.initial()) {
    /*idle event*/
    on<Initialize>((event, emit) async {
      if (state.idleList.isNotEmpty) {
          emit( SearchState(
          searchResultList: [], idleList: state.idleList, isloading: false, isError: false));
        return;
      }
      emit(const SearchState(
          searchResultList: [], idleList: [], isloading: true, isError: false));
      // get trending
      final _result = await _downloadService.getDownloadsImage();
      final _state = _result.fold(
          (MainFailure f) => const SearchState(
              searchResultList: [],
              idleList: [],
              isloading: false,
              isError: true),
          (List<Downloads> list) => SearchState(
              searchResultList: [],
              idleList: list,
              isloading: false,
              isError: false));

      // show to ui
      emit(_state);
    });
    /*searchResultEvent*/
    on<SearchMovie>((event, emit) {
      // call search movie UI
      _searchService.searchMovies(movieQuery: event.movieQuery);
    });
  }
}
