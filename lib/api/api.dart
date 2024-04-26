import 'dart:convert';

import 'package:movie_application/constant.dart';
import 'package:movie_application/models/movie.dart';
import 'package:http/http.dart' as http;
class Api{
  static const _trendingUrl='https://api.themoviedb.org/3/movie/popular?api_key=${Constant.apikey}';
  static const _topRatedUrl='https://api.themoviedb.org/3/trending/movie/day?api_key=${Constant.apikey}';
  static const _upComingUrl='https://api.themoviedb.org/3/movie/upcoming?api_key=${Constant.apikey}';
  static const _movieCast='https://api.themoviedb.org/3/movie/movie_id/credits?api_key=${Constant.apikey}s';



  Future<List<Movie>> getPopularMovies() async{
    final response= await http.get(Uri.parse(_trendingUrl));
    if(response.statusCode == 200){
      final decodeddata= json.decode(response.body)['results'] as List;
      return decodeddata.map((movie) => Movie.fromJson(movie)).toList();
    }else{
      throw Exception('Something went wrong');
    }
  }
  Future<List<Movie>> getTopRatedMovies() async{
    final response= await http.get(Uri.parse(_topRatedUrl));
    if(response.statusCode == 200){
      final decodeddata= json.decode(response.body)['results'] as List;
      return decodeddata.map((movie) => Movie.fromJson(movie)).toList();
    }else{
      throw Exception('Something went wrong');
    }
  }
  Future<List<Movie>> getUpcomingMovies() async{
    final response= await http.get(Uri.parse(_upComingUrl));
    if(response.statusCode == 200){
      final decodeddata= json.decode(response.body)['results'] as List;
      return decodeddata.map((movie) => Movie.fromJson(movie)).toList();
    }else{
      throw Exception('Something went wrong');
    }
  }
  Future<List<Movie>> getMovieCast() async{
    final response= await http.get(Uri.parse(_movieCast));
    if(response.statusCode == 200){
      final decodeddata= json.decode(response.body)['name'] as List;
      return decodeddata.map((movie) => Movie.fromJson(movie)).toList();
    }else{
      throw Exception('Something went wrong');
    }
  }

}