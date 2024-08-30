import 'package:flutter/material.dart';
import 'dart:math';

class PhotosBackgrounds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    double photoHeight = screenHeight * 0.4;

    final double rotationAngle = -27 * pi / 180;

    final List<String> upperPhotos = [
      'assets/images/1.png',
      'assets/images/2.png',
      'assets/images/3.png',
    ];

    final List<String> midPhotos = [
      'assets/images/4.png',
      'assets/images/5.png',
      'assets/images/6.png',
      'assets/images/7.png',
    ];

    final List<String> lowerPhotos = [
      'assets/images/1.png',
      'assets/images/2.png',
      'assets/images/3.png',
    ];

    return Stack(
      children: [
        Positioned(
          top: -150,
          left: -70,
          child: Transform.rotate(
            angle: rotationAngle,
            origin: Offset(0, 0),
            child: SizedBox(
              height: photoHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: upperPhotos.map((path) {
                  return Container(
                    margin: EdgeInsets.all(6.0),
                    child: Image.asset(path),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
        Positioned(
          top: 45,
          left: -60,
          child: Transform.rotate(
            angle: rotationAngle,
            origin: Offset(0, 0),
            child: SizedBox(
              height: photoHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: midPhotos.map((path) {
                  return Container(
                    margin: EdgeInsets.all(6.0),
                    child: Image.asset(path),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
        Positioned(
          top: 297,
          left: 0,
          child: Transform.rotate(
            angle: rotationAngle,
            origin: Offset(0, 0),
            child: SizedBox(
              height: photoHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: lowerPhotos.map((path) {
                  return Container(
                    margin: EdgeInsets.all(6.0),
                    child: Image.asset(path),
                  );
                }).toList(),
              ),
            ),
          ),
        ),

        // Layer
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0x00FFFAFA),
                  Color(0x1010FFFAFA),
                  Color(0xFFFFFAFA),
                ],
                stops: [0.0, 0.13, 0.36],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
