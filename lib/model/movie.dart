class Movie {
  int id;
  String title;
  String director;
  String summary;
  List<String> genres;

  Movie(
      {required this.id,
      required this.title,
      required this.director,
      required this.summary,
      required this.genres});
}
