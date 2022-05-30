
import 'GenreModel.dart';

class MovieModel {
  num id = 0;
  String title = "";
  String subTitle = "";
  String releaseDate = "";
  num voteAverage = 0.0;
  List<Genre> genres = [];
  String backdropPath = "";
  String posterPath = "";

  String getBackdropURL() {
    return "https://image.tmdb.org/t/p/w185/$backdropPath";
  }

  String getPosterURL() {
    return "https://image.tmdb.org/t/p/w185/$posterPath";
  }

  String getAllGenre() {
    String genre = "";
    for (var element in genres) {
      if (genre.isEmpty) {
        genre = element.name;
      } else {
        genre += ", ";
        genre += element.name;
      }
    }
    return genre;
  }

  MovieModel(this.id, this.title, this.subTitle, this.releaseDate, this.voteAverage,
      this.genres, this.backdropPath, this.posterPath);
  factory MovieModel.fromJson(dynamic json) {
    List<Genre> genres = [];
    if (json['genres'] != null) {
      var genreObjJson = json['genres'] as List;
      genres = genreObjJson.map((genreJson) => Genre.fromJson(genreJson)).toList();
    }
    return MovieModel(
        json['id'] as num,
        json['original_title'] as String,
        json['overview'] as String,
        json['release_date'] as String,
        json['vote_average'] as num,
        genres,
        json['backdrop_path'] as String,
        json['poster_path'] as String
    );
  }
}
