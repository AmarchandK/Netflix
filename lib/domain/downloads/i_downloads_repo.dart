import 'package:dartz/dartz.dart';
import 'package:netflix/core/failiures/mainfailurs.dart';
import 'package:netflix/domain/downloads/models/downloads.dart';

abstract class IDownloadsRepo {
  Future<Either<MainFailure, List<Downloads>>> getDownloadsImage();
}
