import 'package:dartz/dartz.dart';
import '../../core/failiures/mainfailurs.dart';
import 'model/hot_and_new_rep.dart';

abstract class HotAndNewService {

  Future<Either<MainFailure,HotAndNewRep>> getHotAndNewMovieData();
  Future<Either<MainFailure,HotAndNewRep>> getHotAndNewTvData();
  
}