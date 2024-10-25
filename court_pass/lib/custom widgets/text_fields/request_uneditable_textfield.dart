// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class requestUneditableTextfield extends StatelessWidget {
  final String label;
  final String text;

  requestUneditableTextfield(this.label, this.text);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    double textFieldWidth = screenWidth * 0.9;
    double textFieldHeight = screenHeight * 0.054;

    double textFieldTextSize = screenWidth * 0.035;
    double labelSize = screenWidth * 0.035;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
        Container(
          margin: EdgeInsets.only(left: screenWidth * 0.02),
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
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(36, 93, 93, 146),
                blurRadius: 4,
                offset: Offset(0, 2),
              )
            ]
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 17, vertical: 11),
            child: Text(
              text,
              style: TextStyle(
                color: Color(0xFF9B9797), 
                fontSize: textFieldTextSize,
                fontFamily: "Inter",
                fontWeight: FontWeight.w200
              ),
            ),
          ),
        ),
      ],
    );
  }
}
