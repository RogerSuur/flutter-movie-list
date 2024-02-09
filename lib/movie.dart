class Movie {
  String genre;
  String title;
  String poster;
  String year;
  String director;
  String plot;
  String imdbRating;

  List<String> images;

  Movie(
      {required this.genre,
      required this.title,
      required this.poster,
      required this.year,
      required this.director,
      required this.plot,
      required this.images,
      required this.imdbRating});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['Title'],
      genre: json['Genre'],
      poster: json['Poster'],
      year: json['Year'],
      director: json['Director'],
      plot: json['Plot'],
      images: List<String>.from(json['Images']),
      imdbRating: json['imdbRating'],
    );
  }
}
