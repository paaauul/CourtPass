import 'dart:ui';

import 'package:flutter/material.dart';

Widget userSelectionBackground (){
  return Stack(
    children: [
      //BACKGROUND IMAGE
          Container(
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg_ball.jpeg'),
                fit: BoxFit.cover
              )
            ),
          ),

          //BLUR
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
            child: Container(
              color: Colors.transparent,
            ),
          ),

          //LAYER
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.2),
                    Colors.black.withOpacity(0.4),
                    Colors.black.withOpacity(0.9),
                  ],
                  stops: [0.0, 0.5, 0.9]
                )
              ),
            ),
          ),
    ],
  );
}

Widget signUpBackground (){
  return Stack(
    children: [
      //BACKGROUND IMAGE
          Container(
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg_ball.jpeg'),
                fit: BoxFit.cover
              )
            ),
          ),

          //BLUR
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: Container(
              color: Colors.transparent,
            ),
          ),

          //LAYER
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0),
                    Colors.black.withOpacity(0.5),
                    Colors.black.withOpacity(0.87),
                  ],
                  stops: [0.0, 0.215, 0.36]
                )
              ),
            ),
          ),
    ],
  );
}

Widget logInBackground (){
  return Stack(
    children: [
      //BACKGROUND IMAGE
          Container(
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg_ball.jpeg'),
                fit: BoxFit.cover
              )
            ),
          ),

          //BLUR
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: Container(
              color: Colors.transparent,
            ),
          ),

          //LAYER
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.1),
                    Colors.black.withOpacity(0.5),
                    Colors.black.withOpacity(0.87),
                  ],
                  stops: [0.0, 0.35, 0.48]
                )
              ),
            ),
          ),
    ],
  );
}

Widget verificationBackground (){
  return Stack(
    children: [
      //BACKGROUND IMAGE
          Container(
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg_ball.jpeg'),
                fit: BoxFit.cover
              )
            ),
          ),

          //BLUR
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
            child: Container(
              color: Colors.transparent,
            ),
          ),

          //LAYER
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.1),
                    Colors.black.withOpacity(0.5),
                    Colors.black.withOpacity(0.87),
                  ],
                  stops: [0.0, 0.38, 0.52]
                )
              ),
            ),
          ),
    ],
  );
}

Widget facilityLoginBackground (){
  return Stack(
    children: [
      //BACKGROUND IMAGE
          Container(
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg_ball.jpeg'),
                fit: BoxFit.cover
              )
            ),
          ),

          //BLUR
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
            child: Container(
              color: Colors.transparent,
            ),
          ),

          //LAYER
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.2),
                    Colors.black.withOpacity(0.5),
                    Colors.black.withOpacity(0.92),
                  ],
                  stops: [0.0, 0.38, 0.54]
                )
              ),
            ),
          ),
    ],
  );
}