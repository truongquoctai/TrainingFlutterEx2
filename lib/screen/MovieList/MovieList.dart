
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:training_ex2/Model/MovieModel.dart';
import 'package:training_ex2/screen/MovieDetail/MovieDetail.dart';

import 'View/MovieItemListView.dart';

class MovieList extends StatefulWidget {
  const MovieList({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  State<StatefulWidget> createState() => _MovieList();

}

class _MovieList extends State<MovieList> {
  State<MovieList> createState() => _MovieList();

  final List<MovieModel> movies = List.generate(10, (index) => MovieModel("PHI CÔNG SIÊU ĐẲNG MAVERICK",
      "Sau hơn ba mươi năm phục vụ, Pete “Maverick” Mitchell từng nổi danh là một phi công thử nghiệm quả cảm hàng đầu của Hải quân, né tránh cơ hội thăng chức, điều khiến anh cảm thấy bị bó buộc, để trở về làm chính mình.",
      "2022-12-11", 6.5, [Genre(1, "Action")], "/1Ds7xy7ILo8u2WWxdnkJth1jQVT.jpg", "neMZH82Stu91d3iqvLdNQfqPPyl.jpg"));

  Future<MovieModel> getMovie(int id) async {
    String url = "https://api.themoviedb.org/3/movie/movieId?api_key=28d230cb81d781322b53d31ddbc7bd4a&language=en-US".replaceAll("movieId", id.toString());
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

  void toMovieDetailScreen(int movieId) {
    MovieModel movie = MovieModel("PHI CÔNG SIÊU ĐẲNG MAVERICK",
        "Sau hơn ba mươi năm phục vụ, Pete “Maverick” Mitchell từng nổi danh là một phi công thử nghiệm quả cảm hàng đầu của Hải quân, né tránh cơ hội thăng chức, điều khiến anh cảm thấy bị bó buộc, để trở về làm chính mình.",
        "2022-12-11", 6.5, [Genre(1, "Action")], "/1Ds7xy7ILo8u2WWxdnkJth1jQVT.jpg", "neMZH82Stu91d3iqvLdNQfqPPyl.jpg");
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MovieDetail(movie: movie)
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
                itemCount: movies.length,
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: 10),
                itemBuilder: (context, index) {
                  final movie = movies[index];
                  return GestureDetector(
                      child: MovieItemListView(movie: movie),
                      onTap: () {
                        debugPrint(index.toString());
                        getMovie(752623);
                        toMovieDetailScreen(752623);
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