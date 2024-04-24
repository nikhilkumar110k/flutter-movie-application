import 'dart:ffi';

import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Movie{
  String? title;
  String backDropPath;
  String originalTitle;
  String overview;
  String posterPath;
  Double voteAverage;
  String releaseDate;

  Movie({required this.title,
    required this.backDropPath,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.voteAverage,
    required this.releaseDate});

  factory Movie.fromJson(Map<String, dynamic> json){
    return Movie(
        title:json["title"] ?? "Unavailable",
        backDropPath: json["backdrop_path"] ?? "Unavailable",
        originalTitle: json["original_title"] ?? "Unavailable",
        overview: json["overview"] ?? "Unavailable",
        posterPath: json["poster_path"] ?? "Unavailable",
        voteAverage: json["vote_average"] ?? "Unavailable",
        releaseDate: json["release_date"] ?? "Unavailable");
  }
}
