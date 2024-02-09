import 'package:flutter/material.dart';
import 'package:movie_list/movie.dart';

class MovieDetailView extends StatelessWidget {
  final Movie movie;

  const MovieDetailView({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        title: Padding(
          padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
          child: Text(
            movie.title,
            style: const TextStyle(
                fontSize: 30, color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ),
        backgroundColor: Colors.blueGrey[800],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.network(
              movie.poster,
              fit: BoxFit.cover,
              scale: 0.3,
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(movie.title),
            ),
            Text(movie.director),
            Text(movie.plot),
            Text(movie.imdbRating),
          ],
        ),
      ),
    );
  }
}
