
import 'package:flutter/material.dart';

class SearchProvider extends ChangeNotifier {
  final Map<String, List<String>> movieSections = {
    "Trending Now": [
      "images/download.jpeg",
      "images/OIP.webp",
      "images/OIP (1).jpeg",
    ],
    "Series": [
      "images/OIP (2).jpeg",
      "images/OIP (3).jpeg",
      "images/OIP (4).jpeg",
    ],
    "Korean TV Drama": [
      "images/OIP (5).jpeg",
      "images/OIP (6).jpeg",
      "images/OIP (7).jpeg",
    ],
  };
}