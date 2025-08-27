import 'package:flutter/material.dart';

class DetailsProvider extends ChangeNotifier {
  String title = "CHAPTER 4";
  String match = "95% match";
  String yearDuration = "2023  2h 49m  R  HD";
  String rating = "Most Liked";
  String prolog = "John Wick uncovers a path to defeating The High Table. But before he can earn his freedom, Wick must face off against a new enemy with powerful alliances across the globe and forces that turn old friends into foes.";
  
  List<Map<String, String>> cast = [
    {'name': 'Keanu Reeves', 'role': 'John Wick'},
    {'name': 'Laurance FL...', 'role': 'Bowery King'},
    {'name': 'George Oao...', 'role': 'The Elder'},
    {'name': 'Bill S', 'role': 'N'},
  ];


}
