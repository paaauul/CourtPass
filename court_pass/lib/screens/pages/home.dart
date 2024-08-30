import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: Stack(
        children: [
          
          // GRADIENT
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              width: screenWidth,
              height: screenHeight * 0.74,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFFF6F64),
                    Color(0xFFFFD2C1),
                    Color(0xFFF5F5F5),
                  ],
                  stops: [0.0, 0.56, 1],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
