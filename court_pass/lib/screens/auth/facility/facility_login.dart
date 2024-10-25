// ignore_for_file: prefer_const_constructors

import 'dart:ui';

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

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  
  bool _isPasswordVisible = false;

  Color emailBorderColor = const Color(0xFFFFFAFA);
  Color emailTextColor = const Color(0xFFFFFAFA);
  Color emailIconColor = const Color(0x90888790);
  String emailHintText = "Email";
  Color emailHintTextColor = const Color(0xFFA19B9B);

  Color passwordBorderColor = const Color(0xFFFFFAFA);
  Color passwordHintTextColor = const Color(0xFFA19B9B);
  Color passwordIconColor = const Color(0x90888790);
  String passwordText = "Password";

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
            top: 300, left: 0, right: 0,
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
                

                // EMAIL TEXT FIELD
                Container(
                  width: textFieldWidth,
                  height: textFieldHeight,
                  decoration: BoxDecoration(
                    border: Border.all(color: emailBorderColor),
                    borderRadius: BorderRadius.circular(23.0),
                  ),
                  child: Center(
                    child: TextField(
                      controller: _emailController,
                      style: TextStyle(color: const Color(0xFFFFFAFA), fontSize: textFieldTextSize),
                      decoration: InputDecoration(
                        hintText: emailHintText,
                        hintStyle: TextStyle(
                          color: emailHintTextColor,
                          fontSize: textFieldTextSize,
                          fontWeight: FontWeight.w300,
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 11.5),
                        border: InputBorder.none,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 12, right: 4),
                          child: Icon(
                            Icons.email,
                            color: emailIconColor,
                            size: screenWidth * 0.05,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 17),

                // PASSWORD TEXT FIELD
                Container(
                  width: textFieldWidth,
                  height: textFieldHeight,
                  decoration: BoxDecoration(
                    border: Border.all(color: passwordBorderColor),
                    borderRadius: BorderRadius.circular(23.0),
                  ),
                  child: Center(
                    child: TextField(
                      controller: _passwordController,
                      style: TextStyle(color: const Color(0xFFFFFAFA), fontSize: textFieldTextSize),
                      obscureText: !_isPasswordVisible,
                      decoration: InputDecoration(
                        hintText: passwordText,
                        hintStyle: TextStyle(
                          color: passwordHintTextColor,
                          fontSize: textFieldTextSize,
                          fontWeight: FontWeight.w300,
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11.5),
                        border: InputBorder.none,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 12, right: 6),
                          child: Icon(
                            Icons.lock,
                            color: passwordIconColor,
                            size: screenWidth * 0.05,
                          ),
                        ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible; // Toggle password visibility
                              });
                            },
                            child: Icon(
                              _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                              color: const Color(0x90888790),
                              size: screenWidth * 0.05,
                            ),
                          ),
                        ),
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