import 'package:flutter/material.dart';

class Workout{
  final String imageUrl;
  final String name;
  final int time;
  final String exercises;
  final Color color;

  Workout({required this.imageUrl,required this.name,required this.time,required this.exercises,required this.color});
}