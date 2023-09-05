/*
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

PageController nextPage = PageController();

class UtilModel {
  String image;
  String title;
  String description;
  VoidCallback onPressed;

  UtilModel({
    required this.image,
    required this.title,
    required this.description,
    required this.onPressed,
  });
}

final List<UtilModel> itaem = [
  UtilModel(
      image: 'assets/girl4.png',
      title: 'Shopping time',
      description: 'You can shop through our application',
      onPressed: () {
        nextPage.animateTo(1,
            duration: Duration(milliseconds: 1000), curve: Curves.easeIn);
      }),
  UtilModel(
      image: 'assets/girl3.png',
      title: 'Welcome to the world of shopping',
      description: 'You can shop through our application',
      onPressed: () {
        nextPage.animateTo(2,
            duration: Duration(milliseconds: 1000), curve: Curves.easeIn);
      }),
  UtilModel(
      image: 'assets/girl2.png',
      title: 'Welcome to the world of shopping',
      description: 'You can shop through our application',
      onPressed: () {
        nextPage.animateTo(2,
            duration: Duration(milliseconds: 1000), curve: Curves.easeIn);
      }),
];
*/

class UtilModel {
  String image;
  String title;
  String description;
 // VoidCallback onPressed;
  UtilModel({
    required this.image,
    required this.title,
    required this.description,
    //required this.onPressed,
  });
}
final List<UtilModel> items = [
  UtilModel(
    image: 'assets/girl4.png',
    title: 'Shopping time',
    description: 'You can shop through our application',

  ),
  UtilModel(
    image: 'assets/girl3.png',
    title: 'Shopping Speed',
    description: 'You can shop through our application',

  ),
  UtilModel(
    image: 'assets/girl2.png',
    title: 'Shopping time',
    description: 'You can shop through our application',

  ),
];
