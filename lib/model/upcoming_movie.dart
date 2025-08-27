class UpcomingMovieModel {
  String title;
  String image;
  String releasedate;
  String description;
  double rating;

  UpcomingMovieModel({
    required this.title,
    required this.image,
    required this.releasedate,
    required this.description,
    required this.rating,
  });

  factory UpcomingMovieModel.fromJson(Map<String, dynamic> json) {
    return UpcomingMovieModel(
      title: json["title"] ?? "",
      image: json["poster_path"] ?? "",
      releasedate: json['release_date'] ?? "",
      description: json["overview"] ?? "",
      rating: json["vote_average"] ?? "",
    );
  }
}
