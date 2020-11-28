import 'package:flutter/material.dart';

class Trilha {
  Trilha({
    @required this.id,
    @required this.imageUrl,
    @required this.title,
    @required this.description,
    @required this.progress,
  }) : super();

  final String id;
  final String imageUrl;
  final String title;
  final String description;
  final double progress;
}
