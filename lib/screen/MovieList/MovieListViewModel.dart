
import 'package:flutter/material.dart';
import 'package:training_ex2/Model/ListMovieModel.dart';
import 'package:training_ex2/Repository/MovieRepository.dart';

import '../../Model/MovieModel.dart';

class MovieListViewModel extends ChangeNotifier{
  final MovieRepository repository;
  MovieListViewModel(this.repository);
  ListMovieModel _listMovieModel = ListMovieModel(0, 0, []);

  List<MovieModel> get movieList => _listMovieModel.movies;

  void getListMovie() async {
    _listMovieModel = await repository.getListMovie();
    notifyListeners();
  }
}