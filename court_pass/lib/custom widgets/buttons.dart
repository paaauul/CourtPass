// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String text;

  MainButton(this.text);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth * 0.82,
      height: screenHeight * 0.066,

      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: const [
            Color(0xFFFF6F64),
            Color(0xFFFF4D82),
          ],
          stops: [-0.5, 0.92],
        ),
        borderRadius: BorderRadius.circular(25.0),
        boxShadow: const [
          BoxShadow(
            color: Color(0x4013131A),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Color(0xFFFFFAFA),
            fontSize: screenWidth * 0.042,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class SmallButton extends StatelessWidget {
  final String text;

  SmallButton(this.text);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth * 0.87,
      height: screenHeight * 0.066,

      decoration: BoxDecoration(
        border: Border.all(color: Color(0x7013131A), width: 0.2),
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: const [
            Color(0xFFFF6F64),
            Color(0xFFFF4D82),
          ],
          stops: [-0.5, 0.92],
        ),
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(64, 66, 99, 143),
            blurRadius: 6,
            spreadRadius: 1,
            offset: Offset(0, 2)
          ),
        ],
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Color(0xFFFFFAFA),
            fontFamily: "Poppins",
            fontSize: screenWidth * 0.039,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
