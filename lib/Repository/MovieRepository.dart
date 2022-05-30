
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:training_ex2/Model/ListMovieModel.dart';

import '../Model/MovieModel.dart';

abstract class MovieRepository {
  Future<MovieModel> getMovieDetail(num movieId);

  Future<ListMovieModel> getListMovie();
}

class MovieRepositoryImpl extends MovieRepository {
  @override
  Future<MovieModel> getMovieDetail(num movieId) async {
    String url = "https://api.themoviedb.org/3/movie/movieId?api_key=28d230cb81d781322b53d31ddbc7bd4a&language=en-US".replaceAll("movieId", movieId.toString());
    try {
      var response = await Dio().get(url);
      if (response.statusCode == 200) {
        return MovieModel.fromJson(response.data);
      }
      throw Exception('Failed to load movie');
    } catch(_) {
      throw Exception('Failed to load movie');
    }
  }

  @override
  Future<ListMovieModel> getListMovie() async {
    String url = "https://api.themoviedb.org/3/movie/popular?api_key=28d230cb81d781322b53d31ddbc7bd4a&language=en-US&page=1";
    try {
      var response = await Dio().get(url);
      if (response.statusCode == 200) {
        return ListMovieModel.fromJson(response.data);
      }
      throw Exception('Failed to load List Movie');
    } catch(_) {
      throw Exception('Failed to load List Movie');
    }
  }

}