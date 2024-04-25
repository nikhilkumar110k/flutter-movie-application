import 'package:flutter/material.dart';
import 'package:movie_application/models/movie.dart';

class detailsScreen extends StatelessWidget {
  const detailsScreen({super.key, required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text(movie.title),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Overview: ${movie.overview} \n \n Release Date: ${movie.releaseDate} \n \n Average Vote: ${movie.voteAverage} ',
        style: TextStyle(
          color: Colors.white
        ),),
      ),


    );
  }
}

