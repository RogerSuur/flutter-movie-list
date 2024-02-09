import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_list/movie.dart';
import 'package:movie_list/movie_card.dart';
import 'package:movie_list/movie_detail_view.dart';
import 'package:movie_list/scroll.dart';

void main() {
  runApp(const MaterialApp(
    home: MovieList(),
  ));
}

class MovieList extends StatefulWidget {
  const MovieList({
    Key? key,
  }) : super(key: key);

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  Future<List<Movie>> loadMovies() async {
    String moviesJson = await rootBundle.loadString('assets/movies.json');
    List<dynamic> jsonData = json.decode(moviesJson);
    return jsonData.map<Movie>((json) => Movie.fromJson(json)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        title: const Padding(
          padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
          child: Text(
            'MovieList',
            style: TextStyle(
                fontSize: 30, color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ),
        backgroundColor: Colors.blueGrey[800],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: FutureBuilder<List<Movie>>(
          future: loadMovies(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No movies found'));
            } else {
              return Container(
                padding: const EdgeInsets.all(8),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.7,
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                  ),
                  physics: FastScrollPhysics(scrollSpeed: 4.0),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return MovieCard(movie: snapshot.data![index]);
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
