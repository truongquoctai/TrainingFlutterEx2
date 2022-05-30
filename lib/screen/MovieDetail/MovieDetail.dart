
import 'package:flutter/material.dart';
import 'package:training_ex2/Model/MovieModel.dart';

import '../../gen/assets.gen.dart';

class MovieDetail extends StatefulWidget {

  const MovieDetail({Key? key, required this.movie}) : super(key: key);

  final MovieModel movie;

  @override
  State<StatefulWidget> createState() => _MovieDetail();
}

class _MovieDetail extends State<MovieDetail> {
  State<MovieDetail> createState() => _MovieDetail();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Movie detail',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 22
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
                      widget.movie.getBackdropURL(),
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    left: 20,
                    bottom: 0,
                    child: Image.network(
                      widget.movie.getPosterURL(),
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
                    widget.movie.title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)
                ),
                const Spacer(),
                const Text('6.5'),
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
                      children: const [
                        Text(
                            'Genre',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)
                        ),
                        SizedBox(height: 5),
                        Text(
                            'Drama',
                            style: TextStyle(fontSize: 17)
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Column(
                      children: const [
                        Text(
                            'Release',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)
                        ),
                        SizedBox(height: 5),
                        Text(
                            '2020-03-06',
                            style: TextStyle(fontSize: 17)
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
                widget.movie.subTitle,
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