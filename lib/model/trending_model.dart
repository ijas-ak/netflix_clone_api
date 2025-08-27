class TrendingModel {
  String title;
  String image;
  String releasedate;
  String description;
  double rating;
  TrendingModel({
    required this.image,
    required this.description,
    required this.rating,
    required this.releasedate,
    required this.title,
  });
  factory TrendingModel.fromJson(Map<String, dynamic> json) {
    return TrendingModel(
      image: json["poster_path"] ?? "",
      description: json["overview"],
      rating: (json["vote_average"] as num?)?.toDouble() ?? 0.0,
      releasedate: json["release_date"] ?? "",
      title: json["title"] ?? "",
    );
  }
}
