// ignore_for_file: depend_on_referenced_packages

import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/core/failiures/mainfailurs.dart';
import 'package:netflix/domain/downloads/i_downloads_repo.dart';
import '../../domain/downloads/models/downloads.dart';
part 'downloads_event.dart';
part 'downloads_state.dart';
part 'downloads_bloc.freezed.dart';

@injectable
class DownloadsBloc extends Bloc<DownloadsEvent, DownloadsState> {
  final IDownloadsRepo downloadsRepo;
  DownloadsBloc(this.downloadsRepo)
      : super(
          DownloadsState.initial(),
        ) {
    on<_getDownloadsImage>(
      (event, emit) async {
        emit(
          state.copyWith(
            isLoading: true,
            downloadsFailureOrSuccessOption: none(),
          ),
        );
        final Either<MainFailure, List<Downloads>> downloadsOption =
            await downloadsRepo.getDownloadsImage();
        log(downloadsOption.toString());
        emit(
          downloadsOption.fold(
            (l) => state.copyWith(
              isLoading: false,
              downloadsFailureOrSuccessOption: Some(
                Left(l),
              ),
            ),
            (r) => state.copyWith(
              isLoading: false,
              downloads: r,
              downloadsFailureOrSuccessOption: Some(
                Right(r),
              ),
            ),
          ),
        );
      },
    );
  }
}
