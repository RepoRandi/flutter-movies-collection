import 'package:flutter/material.dart';
import 'package:movies_collection/model/movie.dart';
import 'package:movies_collection/store/movie_store.dart';

class AddMovieDialog extends StatelessWidget {
  final MovieStore movieStore;
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

  AddMovieDialog({super.key, required this.movieStore});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Movie'),
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
            // Tambahkan film ke daftar
            movieStore.addMovie(
              Movie(
                id: DateTime.now().millisecondsSinceEpoch,
                title: titleController.text,
                director: directorController.text,
                summary: summaryController.text,
                genres: List.from(selectedGenres),
              ),
            );
            Navigator.pop(context);
          },
          child: const Text('Add'),
        ),
      ],
    );
  }
}
