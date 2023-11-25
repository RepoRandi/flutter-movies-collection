// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MovieStore on _MovieStore, Store {
  Computed<List<Movie>>? _$filteredMoviesComputed;

  @override
  List<Movie> get filteredMovies => (_$filteredMoviesComputed ??=
          Computed<List<Movie>>(() => super.filteredMovies,
              name: '_MovieStore.filteredMovies'))
      .value;

  late final _$moviesAtom = Atom(name: '_MovieStore.movies', context: context);

  @override
  ObservableList<Movie> get movies {
    _$moviesAtom.reportRead();
    return super.movies;
  }

  @override
  set movies(ObservableList<Movie> value) {
    _$moviesAtom.reportWrite(value, super.movies, () {
      super.movies = value;
    });
  }

  late final _$_MovieStoreActionController =
      ActionController(name: '_MovieStore', context: context);

  @override
  void addMovie(Movie movie) {
    final _$actionInfo =
        _$_MovieStoreActionController.startAction(name: '_MovieStore.addMovie');
    try {
      return super.addMovie(movie);
    } finally {
      _$_MovieStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateMovie(Movie updatedMovie) {
    final _$actionInfo = _$_MovieStoreActionController.startAction(
        name: '_MovieStore.updateMovie');
    try {
      return super.updateMovie(updatedMovie);
    } finally {
      _$_MovieStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteMovie(int id) {
    final _$actionInfo = _$_MovieStoreActionController.startAction(
        name: '_MovieStore.deleteMovie');
    try {
      return super.deleteMovie(id);
    } finally {
      _$_MovieStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void searchByTitle(String title) {
    final _$actionInfo = _$_MovieStoreActionController.startAction(
        name: '_MovieStore.searchByTitle');
    try {
      return super.searchByTitle(title);
    } finally {
      _$_MovieStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
movies: ${movies},
filteredMovies: ${filteredMovies}
    ''';
  }
}
