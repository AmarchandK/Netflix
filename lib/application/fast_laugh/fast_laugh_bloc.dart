// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/downloads/i_downloads_repo.dart';
import 'package:netflix/presentaion/fast_laugh_page/widgets/video_lists.dart';
import '../../domain/downloads/models/downloads.dart';
part 'fast_laugh_event.dart';
part 'fast_laugh_state.dart';
part 'fast_laugh_bloc.freezed.dart';

final videoUrls = [
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/SubaruOutbackOnStreetAndDirt.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/VolkswagenGTIReview.mp4"
];

@injectable
class FastLaughBloc extends Bloc<FastLaughEvent, FastLaughState> {
  FastLaughBloc(IDownloadsRepo _downloadSevice)
      : super(FastLaughState.initial()) {
    on<Initialize>((event, emit) async {
      //sending loading to UI
      emit(
        const FastLaughState(
          videoList: [],
          isLoading: true,
          isError: false,
        ),
      );
      //get trnding movies
      final _result = await _downloadSevice.getDownloadsImage();
      final _state = _result.fold(
          (l) => const FastLaughState(
                videoList: [],
                isLoading: false,
                isError: true,
              ),
          (resp) => FastLaughState(
                videoList: resp,
                isLoading: false,
                isError: false,
              ));
      //movies send to UI
      emit(_state);
    });
    on<LikeVideo>((event, emit) {
      likedvideosNotifier.value.add(event.id);
      likedvideosNotifier.notifyListeners();
    });
    on<UnlikeVideo>((event, emit) {
      likedvideosNotifier.value.remove(event.id);
      likedvideosNotifier.notifyListeners();
    });
  }
}
