import 'dart:convert';

import 'package:movie_application/models/movie.dart';
import 'package:http/http.dart' as http;
class Api{
  static const _trendingUrl='https://api.themoviedb.org/3/movie/popular?api_key=3cdd99d33ed026201557a865d7bd527d';
  Future<List<Movie>> getPopularMovies() async{
    final response= await http.get(Uri.parse(_trendingUrl));
    if(response.statusCode == 200){
      final decodeddata= json.decode(response.body)['results'] as List;
      return decodeddata.map((movie) => Movie.fromJson(movie)).toList();
    }else{
      throw Exception('Something went wrong');
    }
  }

}