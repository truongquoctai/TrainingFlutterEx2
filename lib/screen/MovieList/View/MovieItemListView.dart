
import 'package:flutter/material.dart';
import 'package:training_ex2/Model/MovieModel.dart';
import 'package:training_ex2/gen/assets.gen.dart';

class MovieItemListView extends StatefulWidget {
  const MovieItemListView({Key? key, required this.movie}) : super(key: key);

  final MovieModel movie;
  @override
  State<StatefulWidget> createState() => _MovieItemListView();

}

class _MovieItemListView extends State<MovieItemListView> {
  State<MovieItemListView> createState() => _MovieItemListView();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Row(
          children: [
            const SizedBox(width: 20),
            Image.network(
                widget.movie.getPosterURL(),
                width: 100,
                height: 150
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.movie.title,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    widget.movie.subTitle,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),

            ),
            const SizedBox(width: 20)
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }}