// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:court_pass/custom%20widgets/backgrounds/photos_backgrounds.dart';
import 'package:court_pass/custom%20widgets/text_fields/textfield_with_edit.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFFFFAFA),
      body: Stack(
        children: [
          PhotosBackgrounds(),

          Positioned(
            top: screenHeight * 0.1,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // PHOTO
                  Container(
                    width: screenWidth * 0.4,
                    height: screenWidth * 0.4,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFFFFAFA),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x50010106),
                          blurRadius: 3,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 10),

                  // NAME
                  Text(
                    'Jerry Layug',
                    style: TextStyle(
                      fontFamily: "Poppins",
                      color: Color(0xFF13131A),
                      fontSize: screenWidth * 0.065,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // LOCATION
                  Text(
                    'Cagayan de Oro, Philippines',
                    style: TextStyle(
                      fontFamily: "Poppins",
                      color: Color(0xFF5B5B5B),
                      fontSize: screenWidth * 0.035,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
          ),

          //DETAILS
          Positioned(
            top: screenHeight * 0.4,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //ACCOUNT DETAILS
                    Container(
                      margin: EdgeInsets.only(left: screenWidth * 0.022),
                      child: Text(
                        'Account Details',
                        style: TextStyle(
                          fontFamily: "Poppins",
                          color: Color(0xFF13131A),
                          fontSize: screenWidth * 0.045,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    SizedBox(height: 16),

                    TextfieldWithEdit("First Name", "Jerry"),
                    SizedBox(height: 20),

                    TextfieldWithEdit("Last Name", "Layug"),
                    SizedBox(height: 20),

                    TextfieldWithEdit("Mobile Number", "09123456789"),
                    SizedBox(height: 20),

                    TextfieldWithEdit("Gender", "Male"),
                    SizedBox(height: 30),

                    //SETTINGS
                    Container(
                      margin: EdgeInsets.only(left: screenWidth * 0.024),
                      child: Text(
                        'Settings',
                        style: TextStyle(
                          fontFamily: "Poppins",
                          color: Color(0xFF13131A),
                          fontSize: screenWidth * 0.045,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    // PRIVACY
                    Container(
                      margin: EdgeInsets.only(left: screenWidth * 0.025),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {

                            },
                            child: Text(
                              'Privacy',
                              style: TextStyle(
                                fontFamily: "Poppins",
                                color: Color(0xFF13131A),
                                fontSize: screenWidth * 0.04,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(height: 4),
                          Divider(
                            color: Color(0xFFAFAFAF),
                            thickness: 1,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 12),

                    // DATA AND STORAGE
                    Container(
                      margin: EdgeInsets.only(left: screenWidth * 0.025),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {

                            },
                            child: Text(
                              'Data and Storage',
                              style: TextStyle(
                                fontFamily: "Poppins",
                                color: Color(0xFF13131A),
                                fontSize: screenWidth * 0.04,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(height: 4),
                          Divider(
                            color: Color(0xFFAFAFAF),
                            thickness: 1,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 12),

                    // LANGUAGE
                    Container(
                      margin: EdgeInsets.only(left: screenWidth * 0.025),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {

                            },
                            child: Text(
                              'Language',
                              style: TextStyle(
                                fontFamily: "Poppins",
                                color: Color(0xFF13131A),
                                fontSize: screenWidth * 0.04,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(height: 4),
                          Divider(
                            color: Color(0xFFAFAFAF),
                            thickness: 1,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 14),

                    // HELP CENTER
                    Container(
                      margin: EdgeInsets.only(left: screenWidth * 0.025),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {

                            },
                            child: Text(
                              'Help Center',
                              style: TextStyle(
                                fontFamily: "Poppins",
                                color: Color(0xFF13131A),
                                fontSize: screenWidth * 0.04,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(height: 4),
                          Divider(
                            color: Color(0xFFAFAFAF),
                            thickness: 1,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 14),

                    // ABOUT US
                    Container(
                      margin: EdgeInsets.only(left: screenWidth * 0.025),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {

                            },
                            child: Text(
                              'About Us',
                              style: TextStyle(
                                fontFamily: "Poppins",
                                color: Color(0xFF13131A),
                                fontSize: screenWidth * 0.04,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(height: 4),
                          Divider(
                            color: Color(0xFFAFAFAF),
                            thickness: 1,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 30),

                    //ADD HERE,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
