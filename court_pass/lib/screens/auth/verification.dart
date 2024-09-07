// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:court_pass/custom%20widgets/buttons/back_buttons.dart';
import 'package:court_pass/custom%20widgets/backgrounds/backgrounds.dart';
import 'package:court_pass/custom%20widgets/buttons/buttons.dart';
import 'package:court_pass/screens/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class VerificationPage extends StatefulWidget{
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  @override

  final TextEditingController _codeController = TextEditingController();

  Widget build(BuildContext context){
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    double textFieldWidth = screenWidth * 0.82;
    double textFieldHeight = screenHeight * 0.0645;

    double textFieldTextSize = screenWidth * 0.041;
    double largeTextSize = screenWidth * 0.06;
    double mediumTextSize = screenWidth * 0.045;
    double smallTextSize = screenWidth * 0.038;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          
          verificationBackground(),

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
            top: 340, left: 0, right: 0,
            child: Column(
              children: [

                //VERIFICATION TEXT
                Container(
                  width: textFieldWidth,
                  margin: EdgeInsets.only(left: screenWidth * 0.038),
                  child: Text(
                    'VERIFICATION CODE',
                    style: TextStyle(
                      color: Color(0xFFFFFAFA),
                      fontSize:largeTextSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                SizedBox(height: 11),

                //TEXT
                Container(
                  margin: EdgeInsets.only(right: screenWidth * 0.1),
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: Color(0xFFFFFFAFA),
                        fontSize: mediumTextSize,
                        fontWeight: FontWeight.w300,
                      ),
                      children: const [
                        TextSpan(
                          text: 'Enter your verification code sent to\n'
                        ),
                        TextSpan(
                          text: 'layug.jerryjohn@gmail.com',
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          )
                        )
                      ]
                    ),
                  ),
                ),

                SizedBox(height: 14),

                // CODE TEXT FIELD
                Container(
                  width: textFieldWidth,
                  height: textFieldHeight,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFFFFAFA)),
                    borderRadius: BorderRadius.circular(23.0),
                  ),
                  child: Center(
                    child: TextField(
                      controller: _codeController,
                      style: TextStyle(color: Color(0xFFFFFAFA)),
                      decoration: InputDecoration(
                        hintText: 'Enter Verification Code',
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
                ),

                SizedBox(height: 8),

                //RESEND
                Row(
                  children: [
                    //RESEND
                    GestureDetector(
                      onTap: (){
                        //RESEND
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: screenWidth * 0.36),
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                              color: Color(0xFFFFFAFA),
                              fontSize: smallTextSize,
                              fontWeight: FontWeight.w300
                            ),
                            children: const [
                              TextSpan(
                                text: "Didn't get a code? "
                              ),
                              TextSpan(
                                text: "Resend Code",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold
                                )
                              )
                            ]
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                
                SizedBox(height: 30),

                // CONFIRM BUTTON
                GestureDetector(
                  onTap: () {
                    if(_codeController.text == "123456"){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
                        }
                  },
                  child: MainButton('Confirm')
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