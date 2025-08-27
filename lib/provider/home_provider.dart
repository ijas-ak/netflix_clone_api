import 'package:flutter/material.dart';
import 'package:my_api_project/model/populartv_show.dart';
import 'package:my_api_project/model/trending_model.dart';
import 'package:my_api_project/model/upcoming_movie.dart';
import 'package:my_api_project/service/api_service.dart';

class HomeProvider extends ChangeNotifier {
  List<TrendingModel> trending = [];
  List<UpcomingMovieModel> upcoming = [];
  List<PopularShowModel> popular = [];

  void getTrendingData()async{
    trending = await ApiService().getTrendingMovies();
    notifyListeners();
  }

  void getUpcomingMovies()async{
    upcoming = await ApiService().getUpcomingMovies();
    notifyListeners();
  }

  void getPopularTvShows()async{
      popular = await ApiService().getPopularTvShows();
      notifyListeners();
  }



  
}
