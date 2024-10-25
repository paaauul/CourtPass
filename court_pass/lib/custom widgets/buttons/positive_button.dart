import 'package:flutter/material.dart';

class PositiveButton extends StatelessWidget {
  final String text;

  PositiveButton(this.text);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth * 0.9,
      height: screenHeight * 0.065,

      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xFFFF6F64),
            Color(0xFFFF4D82),
          ],
          stops: [-0.5, 0.92],
        ),
        borderRadius: BorderRadius.circular(14.0),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: const Color(0xFFFFFAFA),
            fontSize: screenWidth * 0.04,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}