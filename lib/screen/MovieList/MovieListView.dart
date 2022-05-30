
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training_ex2/Model/MovieModel.dart';
import 'package:training_ex2/screen/MovieDetail/MovieDetailView.dart';
import 'package:training_ex2/screen/MovieList/MovieListViewModel.dart';

import 'View/MovieItemListView.dart';

class MovieList extends StatefulWidget {
  const MovieList({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  State<StatefulWidget> createState() => _MovieList();

}

class _MovieList extends State<MovieList> {
  State<MovieList> createState() => _MovieList();

  @override
  initState() {
    super.initState();
    context.read<MovieListViewModel>().getListMovie();
  }

  void toMovieDetailScreen(num movieId) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MovieDetail(movieId: movieId)
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 80,
              child: Center(
                child: Column(
                  children: [
                    const Spacer(),
                    Text(
                        widget.title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 22
                        )
                    ),
                    const SizedBox(height: 10),
                  ],
                )
              )
            ),
            Expanded(
              child: ListView.builder(
                itemCount: context.watch<MovieListViewModel>().movieList.length,
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: 10),
                itemBuilder: (context, index) {
                  final movie = context.watch<MovieListViewModel>().movieList[index];
                  return GestureDetector(
                      child: MovieItemListView(movie: movie),
                      onTap: () {
                        toMovieDetailScreen(movie.id);
                      }
                  );
                },
              ),
            )
          ],
        ),
      )
    );
  }
}