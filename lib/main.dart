import 'package:flutter/material.dart';
import 'package:training_ex2/Repository/MovieRepository.dart';
import 'package:training_ex2/screen/MovieDetail/MovieDetailViewModel.dart';
import 'package:training_ex2/screen/MovieList/MovieListView.dart';
import 'package:provider/provider.dart';
import 'package:training_ex2/screen/MovieList/MovieListViewModel.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MovieDetailViewModel(MovieRepositoryImpl())),
        ChangeNotifierProvider(create: (_) => MovieListViewModel(MovieRepositoryImpl())),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MovieList(title: "Popular")
    );
  }
}
