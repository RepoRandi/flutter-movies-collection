import 'package:flutter/material.dart';
import 'package:movies_collection/presentation/pages/movie_list_page.dart';
import 'package:movies_collection/presentation/widgets/add_movie_dialog.dart';
import 'package:movies_collection/store/movie_store.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final MovieStore movieStore = MovieStore();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Movies Collection'),
        ),
        body: MovieListPage(movieStore: movieStore),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AddMovieDialog(movieStore: movieStore);
              },
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
