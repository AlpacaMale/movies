class MovieDetailModel {
  static const String posterPathPrefix = "https://image.tmdb.org/t/p/original";
  final String poster, title, rating, overview, id, genres;
  final List<double> ratingStars;

  MovieDetailModel.fromJson(Map<String, dynamic> json)
      : poster = "$posterPathPrefix${json['backdrop_path']}",
        title = json['title'],
        rating = json['vote_average'].toString(),
        ratingStars = makeStars(json['vote_average'].ceil() / 2.0),
        overview = json['overview'],
        genres = (json['genres'] as List)
            .map((genre) => genre['name'] as String)
            .join(', '),
        id = json['id'].toString();
}

List<double> makeStars(double fucingMagicNumber) {
  List<double> stars = [];
  for (int i = 0; i < fucingMagicNumber.floor(); i++) {
    stars.add(1);
  }
  if (fucingMagicNumber % 1 > 0) {
    stars.add(.5);
  }
  for (int i = stars.length; i < 5; i++) {
    stars.add(0);
  }
  return stars;
}
