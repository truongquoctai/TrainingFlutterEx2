
import 'MovieModel.dart';

class ListMovieModel {
  int page = 0;
  int totalPage = 0;
  List<MovieModel> movies = [];

  ListMovieModel(this.page, this.totalPage, this.movies);

  factory ListMovieModel.fromJson(dynamic json) {
    List<MovieModel> movies = [];
    if (json['results'] != null) {
      var moviesObjJson = json['results'] as List;
      movies = moviesObjJson.map((movieJson) => MovieModel.fromJson(movieJson)).toList();
    }
    return ListMovieModel(
        json['page'] as int,
        json['total_pages'] as int,
        movies);
  }
}