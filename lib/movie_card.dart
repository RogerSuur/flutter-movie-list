import 'package:flutter/material.dart';
import 'package:movie_list/movie.dart';
import 'package:movie_list/movie_detail_view.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => MovieDetailView(movie: movie),
        ));
      },
      borderRadius: BorderRadius.circular(16),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(child: Image.network(movie.poster, fit: BoxFit.cover)),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    movie.title,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    movie.genre,
                    style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  toList() {}
}

// return GridTile(
//       child: Container(
//         padding: const EdgeInsets.all(8),
//         decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
//         child: Column(
//           children: [
//             Image.network(movie.poster, fit: BoxFit.cover),
//             Text(
//               movie.title,
//               style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             Text(
//               movie.genre,
//               style: const TextStyle(
//                   fontSize: 13,
//                   fontWeight: FontWeight.w600,
//                   color: Colors.grey),
//             )
//           ],
//         ),
//       ),
//     );