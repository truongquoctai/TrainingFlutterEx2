
import 'package:flutter/material.dart';
import 'package:training_ex2/Model/MovieModel.dart';
import 'package:training_ex2/Repository/MovieRepository.dart';

class MovieDetailViewModel extends ChangeNotifier {
  final MovieRepository repository;
  MovieDetailViewModel(this.repository);

  MovieModel _movie = MovieModel(0, "", "", "", 0.0, [], "", "");
  MovieModel get movie => _movie;
  String get background => _movie.getBackdropURL();

  void getMovieDetail(num movieId) async {
    _movie = await repository.getMovieDetail(movieId);
    notifyListeners();
  }
}