// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class fillupTextField extends StatelessWidget {
  final String label;
  final String text;

  fillupTextField(this.label, this.text);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    double textFieldWidth = screenWidth * 0.87;
    double textFieldHeight = screenHeight * 0.05;

    double textFieldTextSize = screenWidth * 0.036;
    double labelSize = screenWidth * 0.036;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
        Container(
          margin: EdgeInsets.only(left: screenWidth * 0.025),
          child: Text(
            "$label:",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: labelSize,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),

        SizedBox(height: 8),

        Container(
          width: textFieldWidth,
          height: textFieldHeight,
          decoration: BoxDecoration(
            color: Color(0xFFFFFAFA),
            border: Border.all(color: Color(0xFF13131A), width: 0.1),
            borderRadius: BorderRadius.circular(18.0),
            boxShadow: [
              BoxShadow(
                color: Color(0x2513131A),
                blurRadius: 4,
                offset: Offset(0, 3),
              )
            ]
          ),
          child: Center(
            child: TextField(
              style: TextStyle(color: Color(0xFF13131A), fontSize: textFieldTextSize),
              decoration: InputDecoration(
                hintText: text,
                hintStyle: TextStyle(
                  color: Color(0xFF9B9797),
                  fontFamily: 'Inter',
                  fontSize: textFieldTextSize,
                  fontWeight: FontWeight.w200
                ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 17, vertical: 12),
                  border: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
