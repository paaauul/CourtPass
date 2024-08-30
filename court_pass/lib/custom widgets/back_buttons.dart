import 'package:flutter/material.dart';

Widget SplashBackButton () {
  return Container(
    decoration: BoxDecoration(
      shape: BoxShape.circle
    ),
    width: 30, height: 30,
    child: Icon(
      Icons.arrow_back,
      color: Color(0xFFFFFAFA),
      size: 27,
    ),
  );
}