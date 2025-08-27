import 'package:flutter/material.dart';
import 'package:my_api_project/model/populartv_show.dart';
import 'package:my_api_project/model/trending_model.dart';
import 'package:my_api_project/model/upcoming_movie.dart';
import 'package:my_api_project/service/api_service.dart';

class HomeProvider extends ChangeNotifier {
  List<TrendingModel> trending = [];
  List<UpcomingMovieModel> upcoming = [];
  List<PopularShowModel> popular = [];
  List<TrendingModel> filteredList = [];
  List<UpcomingMovieModel> upcomingFiltered = [];

  void getTrendingData() async {
    List<TrendingModel> data = await ApiService().getTrendingMovies();
    trending = data;
    notifyListeners();
  }

  void getUpcomingMovies() async {
    upcoming = await ApiService().getUpcomingMovies();
    notifyListeners();
  }

  void getPopularTvShows() async {
    popular = await ApiService().getPopularTvShows();
    notifyListeners();
  }

  void searchMovie(String query) {
    filteredList =
        trending
            .where(
              (element) =>
                  element.title.toLowerCase().contains(query.toLowerCase()),
            )
            .toList();

    upcomingFiltered =
        upcoming
            .where(
              (element) =>
                  element.title.toLowerCase().contains(query.toLowerCase()),
            )
            .toList();

    notifyListeners();
  }
}
