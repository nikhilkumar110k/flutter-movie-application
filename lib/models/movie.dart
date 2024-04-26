import 'dart:ffi';

import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Movie{
  String title;
  String backDropPath;
  String originalTitle;
  String overview;
  String posterPath;
  double voteAverage;
  String releaseDate;
  double votecount;

  Movie({required this.title,
    required this.backDropPath,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.voteAverage,
    required this.releaseDate,
    required this.votecount,
    });

  factory Movie.fromJson(Map<String, dynamic> json){
    return Movie(
        title:json["title"].toString(),
        backDropPath: json["backdrop_path"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        voteAverage: json["vote_average"].toDouble(),
        votecount: json["vote_count"].toDouble(),
        releaseDate: json["release_date"]);
  }
}
