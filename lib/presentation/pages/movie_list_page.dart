import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:movies_collection/presentation/widgets/edit_movie_dialog.dart';
import 'package:movies_collection/presentation/widgets/movie_list_item.dart';
import 'package:movies_collection/store/movie_store.dart';

class MovieListPage extends StatelessWidget {
  final MovieStore movieStore;

  const MovieListPage({super.key, required this.movieStore});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onChanged: (title) {
              movieStore.searchByTitle(title);
            },
            decoration: const InputDecoration(
              labelText: 'Search by Title',
            ),
          ),
        ),
        Expanded(
          child: Observer(
            builder: (context) {
              return ListView.builder(
                itemCount: movieStore.filteredMovies.length,
                itemBuilder: (context, index) {
                  return MovieListItem(
                    movie: movieStore.filteredMovies[index],
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return EditMovieDialog(
                            movieStore: movieStore,
                            movie: movieStore.filteredMovies[index],
                          );
                        },
                      );
                    },
                    onLongPress: () {
                      movieStore
                          .deleteMovie(movieStore.filteredMovies[index].id);
                    },
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
