// ignore_for_file: prefer_const_constructors
import 'dart:ui';

import 'package:court_pass/custom%20widgets/buttons/back_buttons.dart';
import 'package:court_pass/custom%20widgets/buttons/buttons.dart';
import 'package:court_pass/custom%20widgets/backgrounds/backgrounds.dart';
import 'package:court_pass/screens/auth/sports_person/sportsperson_login.dart';
import 'package:court_pass/screens/auth/user_selection.dart';
import 'package:court_pass/screens/auth/verification.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SportsPersonSignupPage extends StatelessWidget{
  const SportsPersonSignupPage({super.key});

  @override
  Widget build(BuildContext context){
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    double textFieldWidth = screenWidth * 0.86;
    double textFieldHeight = screenHeight * 0.0645;

    double textFieldTextSize = screenWidth * 0.041;
    double smallTextSize = screenWidth * 0.0335;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [

          signUpBackground(),

          //BACK BUTTON
          Positioned(
            top: 55, left: 24,
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => UserSelectionPage()));
              },
              child: SplashBackButton()
            ),
          ),

          //TEXT AND TEXTFIELDS
          Positioned(
            top: 190, left: 0, right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                //SIGN UP TEXT
                Container(
                  width: textFieldWidth,
                  margin: EdgeInsets.only(left: screenWidth * 0.06),
                  child: Text(
                    'SIGN UP',
                    style: TextStyle(
                      color: Color(0xFFFFFAFA),
                      fontSize: screenWidth * 0.061,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                SizedBox(height: 12),

                //NAME TEXTFIELDS
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    // FIRST NAME
                    Container(
                      width: textFieldWidth * 0.5,
                      height: textFieldHeight,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFFFFAFA)),
                        borderRadius: BorderRadius.circular(23.0),
                      ),
                      child: Center(
                        child: TextField(
                          style: TextStyle(color: Color(0xFFFFFAFA)),
                          decoration: InputDecoration(
                            hintText: 'First Name',
                            hintStyle: TextStyle(
                                color: Color(0xFFA19B9B),
                                fontSize: textFieldTextSize,
                                fontWeight: FontWeight.w300),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 18, vertical: 13.5),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(width: textFieldWidth * 0.025),


                    // LAST NAME
                    Container(
                      width: textFieldWidth * 0.475,
                      height: textFieldHeight,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFFFFAFA)),
                        borderRadius: BorderRadius.circular(23.0),
                      ),
                      child: Center(
                        child: TextField(
                          style: TextStyle(color: Color(0xFFFFFAFA)),
                          decoration: InputDecoration(
                            hintText: 'Last Name',
                            hintStyle: TextStyle(
                                color: Color(0xFFA19B9B),
                                fontSize: textFieldTextSize,
                                fontWeight: FontWeight.w300),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 17, vertical: 13.5),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    )
                  ],
                ),

                SizedBox(height: 13),

                //EMAIL TEXT FIELD
                Container(
                  width: textFieldWidth,
                  height: textFieldHeight,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFFFFAFA)),
                    borderRadius: BorderRadius.circular(23.0),
                  ),
                  child: Center(
                    child: TextField(
                      style: TextStyle(color: Color(0xFFFFFAFA)),
                      decoration: InputDecoration(
                        hintText: 'Email',
                        hintStyle: TextStyle(
                          color: Color(0xFFA19B9B),
                          fontSize: textFieldTextSize,
                          fontWeight: FontWeight.w300,
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 13.5),
                        border: InputBorder.none,
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(left: 12, right: 6),
                          child: Icon(
                            Icons.email,
                            color: Color(0x90888790),
                            size: screenWidth * 0.05,
                          )
                        )
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 13),

                // PASSWORD TEXT FIELD
                Container(
                  width: textFieldWidth,
                  height: textFieldHeight,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFFFFAFA)),
                    borderRadius: BorderRadius.circular(23.0),
                  ),
                  child: Center(
                    child: TextField(
                      style: TextStyle(color: Color(0xFFFFFAFA)),
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextStyle(
                            color: Color(0xFFA19B9B),
                            fontSize: textFieldTextSize,
                            fontWeight: FontWeight.w300),
                        contentPadding: EdgeInsets.symmetric(vertical: 13.5),
                        border: InputBorder.none,
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(left: 12, right: 6),
                          child: Icon(
                            Icons.lock,
                            color: Color(0x90888790),
                            size: screenWidth * 0.05,
                          )
                        )
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 13),

                // CONFIRM PASSWORD TEXT FIELD
                Container(
                  width: textFieldWidth,
                  height: textFieldHeight,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFFFFAFA)),
                    borderRadius: BorderRadius.circular(23.0),
                  ),
                  child: Center(
                    child: TextField(
                      style: TextStyle(color: Color(0xFFFFFAFA)),
                      decoration: InputDecoration(
                        hintText: 'Confirm Password',
                        hintStyle: TextStyle(
                            color: Color(0xFFA19B9B),
                            fontSize: textFieldTextSize,
                            fontWeight: FontWeight.w300),
                        contentPadding: EdgeInsets.symmetric(vertical: 13.5),
                        border: InputBorder.none,
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(left: 12, right: 6),
                          child: Icon(
                            Icons.lock,
                            color: Color(0x90888790),
                            size: screenWidth * 0.05,
                          )
                        )
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10),

                // TERMS AND PRIVACY TEXT
                Container(
                  margin: EdgeInsets.only(left: screenWidth * 0.10, right: screenWidth * 0.1),
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: Color(0xFFFFFAFA),
                        fontSize: smallTextSize,
                        fontWeight: FontWeight.w300,
                      ),
                      children: [
                        TextSpan(
                          text: 'By signing up, you agree to the ',
                        ),
                        TextSpan(
                          text: 'Terms of Service',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Navigate to Terms of Service screen or handle tap
                            },
                        ),
                        TextSpan(
                          text: ' and the ',
                        ),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Navigate to Privacy Policy screen or handle tap
                            },
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 22),

                // SIGNUP BUTTON
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => VerificationPage()),
                    );
                  },
                  child: MainButton('Sign Up')
                ),

                SizedBox(height: 18),

                //SIGN UP WITH
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: textFieldWidth * 0.31,
                        height: 1,
                        color: Color(0xFFFFFAFA),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.0),
                        child: Text(
                          "Or sign up with",
                          style: TextStyle(
                            color: Color(0xFFFFFAFA),
                            fontSize: smallTextSize,
                            fontWeight: FontWeight.w300
                          ),
                        ),
                      ),
                      Container(
                        width: textFieldWidth * 0.31,
                        height: 1,
                        color: Color(0xFFFFFAFA),
                      )
                    ],
                  )
                ),

                SizedBox(height: 14),

                // ALTERNATIVES
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      // FACEBOOK
                      GestureDetector(
                        onTap: (){

                        },
                        child: Container(
                          width: screenWidth * 0.1,
                          height: screenWidth * 0.1,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage('assets/icons/icon_facebook.png'),
                              fit: BoxFit.cover
                            ),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x4013131A),
                                blurRadius: 10,
                                offset: Offset(0, 4)
                              )
                            ]
                          ),
                        ),
                      ),

                      SizedBox(width: 14),

                      // GOOGLE
                      GestureDetector(
                        onTap: (){

                        },
                        child: Container(
                          width: screenWidth * 0.1,
                          height: screenWidth * 0.1,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage('assets/icons/icon_google.png'),
                              fit: BoxFit.cover
                            ),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x4013131A),
                                blurRadius: 10,
                                offset: Offset(0, 4)
                              )
                            ]
                          ),
                        ),
                      )
                    ],
                  )
                )

                //END OF TEXT AND TEXTFIELDS
              ],
            ),
          ),

          // BOTTOM BOX
          Positioned(
            bottom: -0.5,
            left: -5,
            right: -5,
            child: Container(
              height: screenHeight * 0.073,
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: Color(0xFFFFFAFA), width: 0.5)),
                color: Color(0x3013131A),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x5513131A),
                    blurRadius: 1,
                    offset: Offset(0, -2)
                  )
                ]
              ),
              child: Center(
                child: Text.rich(
                  TextSpan(
                    style: TextStyle(
                      color: Color(0xFFFFFAFA),
                      fontSize: screenWidth * 0.036,
                      fontWeight: FontWeight.w400,
                    ),
                    children: [
                      TextSpan(text: 'Already have an account? '),
                      TextSpan(
                        text: 'Login',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SportsPersonLoginPage()),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )

          // END OF MAIN CHILDREN
        ],
      ),
    );
  }
}