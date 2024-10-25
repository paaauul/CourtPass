import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final bool isEnabled;
  final nextPage;

  CustomButton(
    this.text,
    this.backgroundColor,
    this.textColor, {
    this.isEnabled = true,
    this.nextPage
  });

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: isEnabled
          ? () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => nextPage),
              );
            }
          : null,
      child: Container(
        width: screenWidth * 0.91,
        height: screenHeight * 0.069,
        decoration: BoxDecoration(
          color: isEnabled
              ? backgroundColor
              : Colors.grey, // Change color if disabled
          borderRadius: BorderRadius.circular(18.0),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: screenWidth * 0.04,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
