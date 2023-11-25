import 'package:flutter/material.dart';
import 'package:movies_collection/model/movie.dart';
import 'package:movies_collection/store/movie_store.dart';

class EditMovieDialog extends StatelessWidget {
  final MovieStore movieStore;
  final Movie movie;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController directorController = TextEditingController();
  final TextEditingController summaryController = TextEditingController();
  final List<String> genres = [
    "Drama",
    "Action",
    "Animation",
    "Sci-Fi",
    "Horror"
  ];
  final List<String> selectedGenres = [];

  EditMovieDialog({super.key, required this.movieStore, required this.movie}) {
    titleController.text = movie.title;
    directorController.text = movie.director;
    summaryController.text = movie.summary;
    selectedGenres.addAll(movie.genres);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit Movie'),
      content: Column(
        children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(labelText: 'Title'),
          ),
          TextField(
            controller: directorController,
            decoration: const InputDecoration(labelText: 'Director'),
          ),
          TextField(
            controller: summaryController,
            decoration: const InputDecoration(labelText: 'Summary'),
          ),
          Wrap(
            children: genres.map((genre) {
              return FilterChip(
                label: Text(genre),
                selected: selectedGenres.contains(genre),
                onSelected: (bool selected) {
                  if (selected) {
                    selectedGenres.add(genre);
                  } else {
                    selectedGenres.remove(genre);
                  }
                },
              );
            }).toList(),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            movieStore.updateMovie(
              Movie(
                id: movie.id,
                title: titleController.text,
                director: directorController.text,
                summary: summaryController.text,
                genres: List.from(selectedGenres),
              ),
            );
            Navigator.pop(context);
          },
          child: const Text('Update'),
        ),
      ],
    );
  }
}
