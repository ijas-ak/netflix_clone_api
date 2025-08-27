class PopularShowModel {
  String title;
  String image;
  String releasedate;
  String description;
  String rating;
  PopularShowModel({
    required this.image,
    required this.description,
    required this.rating,
    required this.releasedate,
    required this.title,
  });
  factory PopularShowModel.fromJson(Map<String, dynamic> json) {
    return PopularShowModel(
      image: json["poster_path"],
      description: json["overview"],
      rating: json["vote_average"],
      releasedate: json['release_date'],
      title: json["title"],
    );
  }
}
