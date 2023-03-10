class Movie{
  final int id;
  final double popularity;
  final String title;
  final String backPoster;
  final String poster;
  final String overview;
  final double rating;

  Movie(
      this.id,
      this.popularity,
      this.title,
      this.backPoster,
      this.poster,
      this.overview,
      this.rating,
      );

  Movie.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        popularity = json["popularity"],
        title = json["title"],
        backPoster = json["backPoster"],
        poster = json["poster"],
        overview = json["overview"],
        rating = json["rating"].toDouble();
}