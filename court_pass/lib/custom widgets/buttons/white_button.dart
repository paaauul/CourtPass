import 'package:flutter/material.dart';

class WhiteButton extends StatelessWidget {
  final String text;

  WhiteButton(this.text);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth * 0.9,
      height: screenHeight * 0.065,

      decoration: BoxDecoration(
        color: const Color(0xFFFFFAFA),
        borderRadius: BorderRadius.circular(14.0),
        border: Border.all(
          color: const Color(0xFFFF6F64),
          width: 1.5
        )
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: const Color(0xFFFF6F64),
            fontSize: screenWidth * 0.042,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}