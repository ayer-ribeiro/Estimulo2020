import 'package:flutter/material.dart';

class Aula {
  Aula({
    @required this.videoUrl,
    @required this.thumbnail,
    @required this.title,
    @required this.description,
  }) : super();

  final String videoUrl;
  final String thumbnail;
  final String title;
  final String description;
}
