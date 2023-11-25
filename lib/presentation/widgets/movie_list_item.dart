import 'package:flutter/material.dart';
import 'package:movies_collection/model/movie.dart';

class MovieListItem extends StatelessWidget {
  final Movie movie;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  const MovieListItem(
      {super.key,
      required this.movie,
      required this.onTap,
      required this.onLongPress});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(movie.title),
      subtitle: Text(movie.director),
      onTap: onTap,
      onLongPress: onLongPress,
    );
  }
}
