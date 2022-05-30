
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training_ex2/Model/MovieModel.dart';
import 'package:training_ex2/screen/MovieDetail/MovieDetailViewModel.dart';

import '../../gen/assets.gen.dart';

class MovieDetail extends StatefulWidget {

  const MovieDetail({Key? key, required this.movieId}) : super(key: key);

  final num movieId;

  @override
  State<StatefulWidget> createState() => _MovieDetail();
}

class _MovieDetail extends State<MovieDetail> {
  State<MovieDetail> createState() => _MovieDetail();

  @override
  initState() {
    super.initState();
    context.read<MovieDetailViewModel>().getMovieDetail(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Movie detail',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 18
            )
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue,
        shadowColor: Colors.white,
      ),
      body: Center (
        child: Column(
          children: [
            SizedBox(
                width: double.infinity,
                height: 250,
                child: Stack (
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 3.0, right: 3.0),
                      child: Image.network(
                        context.watch<MovieDetailViewModel>().movie.getBackdropURL(),
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      left: 20,
                      bottom: 0,
                      child: Image.network(
                        context.watch<MovieDetailViewModel>().movie.getPosterURL(),
                        width: 100,
                        height: 150,
                        fit: BoxFit.fill,
                      ),
                    )
                  ],
                )
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const SizedBox(width: 20),
                Text(
                    context.watch<MovieDetailViewModel>().movie.title,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17)
                ),
                const Spacer(),
                Text(context.watch<MovieDetailViewModel>().movie.voteAverage.toString()),
                const SizedBox(width: 20)
              ],
            ),
            const SizedBox(height: 10),
            Container(height: 2.0, color: Colors.black12),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: InkWell(
                      onTap: () {
                        debugPrint("Reviews Tapped");
                      },
                      child: Center(
                        child: Column(
                          children: [
                            const SizedBox(height: 10),
                            Assets.images.iconReview.image(width: 30, height: 30),
                            const SizedBox(height: 5),
                            const Text(
                                'Reviews',
                                style: TextStyle(fontSize: 17)
                            ),
                            const SizedBox(height: 5),
                          ],
                        ),
                      )
                  ),
                ),
                Container(width: 1.0, color: Colors.black12),
                Expanded(
                  flex: 1,
                  child: InkWell(
                      onTap: () {
                        debugPrint("Trailers Tapped");
                      },
                      child: Center(
                        child: Column(
                          children: [
                            const SizedBox(height: 10),
                            Assets.images.iconPlay.image(width: 30, height: 30),
                            const SizedBox(height: 5),
                            const Text(
                                'Trailers',
                                style: TextStyle(fontSize: 17)
                            ),
                            const SizedBox(height: 5),
                          ],
                        ),
                      )
                  ),
                )
              ],
            ),

            Container(height: 2.0, color: Colors.black12),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Column(
                      children: [
                        const Text(
                            'Genre',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)
                        ),
                        const SizedBox(height: 5),
                        Container(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Text(
                            context.watch<MovieDetailViewModel>().movie.getAllGenre(),
                            style: const TextStyle(fontSize: 17),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Column(
                      children: [
                        const Text(
                            'Release',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)
                        ),
                        const SizedBox(height: 5),
                        Text(
                            context.watch<MovieDetailViewModel>().movie.releaseDate,
                            style: const TextStyle(fontSize: 17)
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Container(height: 2.0, color: Colors.black12),
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                context.watch<MovieDetailViewModel>().movie.subTitle,
                style: const TextStyle(fontSize: 16),
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}