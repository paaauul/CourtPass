// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:court_pass/custom%20widgets/backgrounds/backgrounds.dart';
import 'package:court_pass/custom%20widgets/buttons/buttons.dart';
import 'package:court_pass/screens/auth/facility/facility_login.dart';
import 'package:court_pass/screens/auth/sports_person/sportsperson_signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserSelectionPage extends StatelessWidget{
  const UserSelectionPage({super.key});

  @override
  Widget build(BuildContext context){
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [

          userSelectionBackground(),

          //TEXTS AND TEXTFIELDS
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [

                //QUESTION
                Text(
                  'How will you be using the Court Pass?',
                    style: TextStyle(
                      color: Color(0xFFFFFAFA),
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.bold
                    ),
                ),
                
                SizedBox(height: 18),

                //SPORTS PERSON BUTTON
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SportsPersonSignupPage()));
                  },
                  child: MainButton('I am a Sports Person'),
                ),

                SizedBox(height: 8),

                //FACILITY PERSONNEL BUTTON
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => FacilityLoginPage()));
                  },
                  child: MainButton('I am a Facility Personnel'),
                ),

                //END OF TEXT AND TEXTFIELDS
              ],
            ),
          )

          //END OF MAIN CHILDREN
        ],
      ),
    );
  }
}