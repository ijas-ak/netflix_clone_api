import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:my_api_project/model/populartv_show.dart';
import 'package:my_api_project/model/trending_model.dart';
import 'package:my_api_project/model/upcoming_movie.dart';
import 'package:my_api_project/service/api_constants.dart';

class ApiService {
  Dio dio = Dio();

  Future getTrendingMovies() async {
    try {
      log("success");
      final responce = await dio.get(ApiConstants().trendingurl);
      List<dynamic> data = responce.data["results"];
      
      return data.map((e) => TrendingModel.fromJson(e)).toList();
    } on DioException catch (e) {
      print(e);
    }
  }

  Future getUpcomingMovies()async{
    final responce = await dio.get(ApiConstants().upcomingurl);
    List<dynamic> data =responce.data["results"];
    return data.map((e) => UpcomingMovieModel.fromJson(e),).toList();
  }

    Future getPopularTvShows() async {
    try {
      log("success");
      final responce = await dio.get(ApiConstants().populartvshowsurl);
      List<dynamic> data = responce.data["results"];
      
      return data.map((e) => PopularShowModel.fromJson(e)).toList();
    } on DioException catch (e) {
      print(e);
    }
  }

  
}
