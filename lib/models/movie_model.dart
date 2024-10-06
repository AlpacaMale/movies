class MovieModel {
  static const String posterPathPrefix = "https://image.tmdb.org/t/p/w500";
  final String poster, title, id;

  MovieModel.fromJson(Map<String, dynamic> json)
      : poster = "$posterPathPrefix${json['poster_path']}",
        title = json['title'],
        id = json['id'].toString();
}
