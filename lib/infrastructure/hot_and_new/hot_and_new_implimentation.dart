import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/hot_and_new/hot_and_new_service.dart';
import 'package:netflix/domain/hot_and_new/model/hot_and_new_rep.dart';
import '../../core/failiures/mainfailurs.dart';
import '../../domain/api_end_points.dart';

@LazySingleton(as:HotAndNewService)
class HotAndNewImplimentation implements HotAndNewService {
  @override
  Future<Either<MainFailure, HotAndNewRep>> getHotAndNewMovieData() async {
    try {
      final response =
          await Dio(BaseOptions()).get(ApiEndPoints.hotAndNewMovie);
      //  log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = HotAndNewRep.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } on DioError catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }

  @override
  Future<Either<MainFailure, HotAndNewRep>> getHotAndNewTvData() async {
    try {
      final response = await Dio(BaseOptions()).get(ApiEndPoints.hotAndNewTv);
      //  log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = HotAndNewRep.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } on DioError catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }
}
