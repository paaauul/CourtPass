import 'package:court_pass/custom%20widgets/buttons/buttons.dart';
import 'package:court_pass/custom%20widgets/drop_down/dropdown.dart';
import 'package:court_pass/custom%20widgets/backgrounds/photos_backgrounds.dart';
import 'package:court_pass/custom%20widgets/text_fields/fillup_textfield.dart';
import 'package:flutter/material.dart';

class Fillup extends StatefulWidget {
  const Fillup({super.key});

  @override
  State<Fillup> createState() => _FillupState();
}

class _FillupState extends State<Fillup> {
  @override
  Widget build(BuildContext context) {

    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 1.16,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              PhotosBackgrounds(),

              Positioned(
                top: screenHeight * 0.35,
                left: 0,
                right: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //WELCOME
                    Container(
                      margin: EdgeInsets.only(left: screenWidth * 0.06),
                      child: Text(
                        'Welcome Jerry!',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color(0xFF13131A),
                          fontFamily: 'Poppins',
                          fontSize: screenWidth * 0.084,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),

                    //DESCRIPTION
                    Container(
                      margin: EdgeInsets.only(left: screenWidth * 0.068, right: screenWidth * 0.06),
                      child: Text(
                        'To get started, provide us your personal details and complete your account creation.',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color(0xFF13131A),
                          fontFamily: 'Poppins',
                          fontSize: screenWidth * 0.036,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Positioned(
                top: screenHeight * 0.49,
                left: screenWidth * 0.06,
                child: Column(
                  children: [
                    fillupTextField("First Name", "Jerry"),
                    SizedBox(height: 20),

                    fillupTextField("Last Name", "Layug"),
                    SizedBox(height: 20),
                
                    fillupTextField("Email", "layug.jerryjohn@gmail.com"),
                    SizedBox(height: 20),

                    fillupTextField("Mobile Number", "09125436789"),
                    SizedBox(height: 20),

                    genderDropDown("Male"),
                    SizedBox(height: 38),

                    GestureDetector(
                      onTap: (){
                        
                      },
                      child: Container(
                        child: SmallButton("Submit"),
                      )
                    )
                  ],
                ),
              )
              //END
            ],
          ),
        ),
      ),
    );
  }
}
