import 'package:mobx/mobx.dart';
import 'package:movies_collection/model/movie.dart';

part 'movie_store.g.dart';

class MovieStore = _MovieStore with _$MovieStore;

abstract class _MovieStore with Store {
  @observable
  ObservableList<Movie> movies = ObservableList<Movie>();

  @action
  void addMovie(Movie movie) {
    movies.add(movie);
  }

  @action
  void updateMovie(Movie updatedMovie) {
    final index = movies.indexWhere((movie) => movie.id == updatedMovie.id);
    if (index != -1) {
      movies[index] = updatedMovie;
    }
  }

  @action
  void deleteMovie(int id) {
    movies.removeWhere((movie) => movie.id == id);
  }

  @computed
  List<Movie> get filteredMovies => movies;

  @action
  void searchByTitle(String title) {
    if (title.isNotEmpty) {
      movies = ObservableList<Movie>.of(movies.where(
          (movie) => movie.title.toLowerCase().contains(title.toLowerCase())));
    } else {
      movies = ObservableList<Movie>.of(movies);
    }
  }
}

final movieStore = MovieStore();
