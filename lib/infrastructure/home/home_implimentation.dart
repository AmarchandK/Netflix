// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:netflix/domain/api_end_points.dart';
import 'package:netflix/domain/home/model/home_repo.dart';

class HomeImpli {
  static ValueNotifier<List<HomeData>> latestMovieNotifier = ValueNotifier([]);
  Future<void> gethotHomeMovieDate() async {
    final response = await Dio(BaseOptions()).get(ApiEndPoints.hotAndNewMovie);
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = (response.data['results'] as List).map((e) {
          return HomeData.fromJson(e);
        }).toList();
        latestMovieNotifier.value.clear();
        latestMovieNotifier.value.addAll(result);
        latestMovieNotifier.notifyListeners();
      } else {
        log('Sever failure');
      }
    } on DioError catch (e) {
      log('Dio error ${e.toString()}');
    } catch (e) {
      log("catch error ${e.toString()}");
    }
  }
}
