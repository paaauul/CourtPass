// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:court_pass/classes/facility.dart';
import 'package:court_pass/custom%20widgets/buttons/back_buttons.dart';
import 'package:court_pass/custom%20widgets/backgrounds/backgrounds.dart';
import 'package:court_pass/custom%20widgets/buttons/buttons.dart';
import 'package:flutter/material.dart';

class FacilityLoginPage extends StatefulWidget{
  const FacilityLoginPage({super.key});

  @override
  State<FacilityLoginPage> createState() => _FacilityLoginPageState();
}

class _FacilityLoginPageState extends State<FacilityLoginPage> {

  Color _textFieldColor = Color(0xFFFFFAFA);

  String _codeHintText = "Enter Code";
  Color _codeHintTextColor = Color(0xFFA19B9B);
  Color _codeIconColor = Color(0x90888790);

  final TextEditingController _codeController = TextEditingController();

  void _codeError(){
    setState(() {
      _textFieldColor = Color(0xFFEA4A4A);
      
      _codeHintText = "Invalid Code!";
      _codeHintTextColor = Color(0xFFDE2C2C);
      _codeIconColor = Color(0xFFEA4A4A);

      _codeController.clear();
    });
  }

  @override
  Widget build(BuildContext context){
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    double textFieldWidth = screenWidth * 0.82;
    double textFieldHeight = screenHeight * 0.0645;

    double textFieldTextSize = screenWidth * 0.041;
    double largeTextSize = screenWidth * 0.054;
    double smallTextSize = screenWidth * 0.038;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          
          facilityLoginBackground(),

          //BACK BUTTON
          Positioned(
            top: 55, left: 24,
            child: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: SplashBackButton()
            ),
          ),

          //TEXT AND TEXTFIELDS
          Positioned(
            top: 370, left: 0, right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                //LOGIN TEXT
                Container(
                  width: textFieldWidth,
                  margin: EdgeInsets.only(left: screenWidth * 0.02),
                  child: Text(
                    'LOGIN AS FACILITY PERSONNEL',
                    style: TextStyle(
                      color: Color(0xFFFFFAFA),
                      fontSize: largeTextSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                SizedBox(height: 16),

                // CODE TEXT FIELD
                Container(
                  width: textFieldWidth,
                  height: textFieldHeight,
                  decoration: BoxDecoration(
                    border: Border.all(color: _textFieldColor),
                    borderRadius: BorderRadius.circular(23.0),
                  ),
                  child: Center(
                    child: TextField(
                      controller: _codeController,
                      style: TextStyle(color: Color(0xFFFFFAFA)),
                      decoration: InputDecoration(
                        hintText: _codeHintText,
                        hintStyle: TextStyle(
                            color: _codeHintTextColor,
                            fontSize: textFieldTextSize,
                            fontWeight: FontWeight.w300),
                        contentPadding: EdgeInsets.symmetric(horizontal: 17, vertical: 12.9),
                        border: InputBorder.none,
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(left: 12, right: 6),
                          child: Icon(
                            Icons.lock,
                            color: _codeIconColor,
                            size: screenWidth * 0.05,
                          )
                        )
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 6),

                //CONTACT US
                Row(
                  children: [
                    //CONTACT US
                    GestureDetector(
                      onTap: (){
                        //CONTACT US
                      },
                      child: Container(
                        margin: EdgeInsets.only(left:screenWidth * 0.685),
                        child: Text(
                          'Contact Us',
                          style: TextStyle(
                            fontSize: smallTextSize,
                            color: Color(0xFFFFFAFA),
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                
                SizedBox(height: 26),

                // LOGIN BUTTON
                GestureDetector(
                  onTap: () {
                  },
                  child: MainButton('Login')
                )

                //END OF TEXT AND TEXTFIELDS
              ],
            ),
          ),


          //END OF MAIN CHILDREN
        ],
      ),
    );
  }
}