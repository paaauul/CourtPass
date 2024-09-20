import 'package:flutter/material.dart';

class SummaryBackground extends StatelessWidget {
  final ImageProvider mainPhoto;

  const SummaryBackground(this.mainPhoto, {super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Positioned.fill(
      child: Stack(
        children: [
          // PHOTO
          Positioned(
            top: 1, left: 0, right: 0,
            child: Container(
              width: screenWidth,
              height: screenHeight * 0.35,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: mainPhoto,
                  fit: BoxFit.cover
                ),
              ),
            ),
          ),
          
          // Layer
          Positioned(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0x00FFFAFA),
                    Color(0x10FFFAFA),
                    Color(0xFFFFFAFA),
                  ],
                  stops: [0.0, 0.1, 0.25],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
