import 'dart:ui';
import 'package:court_pass/custom widgets/buttons/buttons.dart';
import 'package:court_pass/custom widgets/drop_down/dropdown.dart';
import 'package:court_pass/custom widgets/backgrounds/photos_backgrounds.dart';
import 'package:court_pass/custom widgets/text_fields/fillup_textfield.dart';
import 'package:court_pass/database%20services/sports_person_database_service.dart';
import 'package:court_pass/screens/pages/sports_person/home/home.dart';
import 'package:flutter/material.dart';

class Fillup extends StatefulWidget {
  const Fillup({super.key});

  @override
  State<Fillup> createState() => _FillupState();
}

class _FillupState extends State<Fillup> {
  final _mobileNumberController = TextEditingController();
  final SportsPersonDatabaseService _sportsPersonDatabaseService = SportsPersonDatabaseService();

  String? firstName;
  String? lastName;
  String? email;

  bool _isLoading = true; // Loading state variable

  @override
  void initState() {
    super.initState();
    fetchUserFirstData();
  }

  Future<void> fetchUserFirstData() async {
    String? userFirstName = await _sportsPersonDatabaseService.getCurrentUserFirstName();
    String? userLastName = await _sportsPersonDatabaseService.getCurrentUserLastName();
    String? userEmail = await _sportsPersonDatabaseService.getCurrentUserEmail();

    setState(() {
      firstName = userFirstName;
      lastName = userLastName;
      email = userEmail;
      _isLoading = false; // Stop loading once data is fetched
    });
  }

  Future submit() async {
    await _sportsPersonDatabaseService.completeAccountCreation(_mobileNumberController.text.trim());
    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SizedBox(
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
                            'Welcome ${firstName ?? "User!"}',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Color(0xFF13131A),
                              fontFamily: 'Poppins',
                              fontSize: screenWidth * 0.084,
                              fontWeight: FontWeight.bold,
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
                        fillupTextField("First Name", firstName ?? "User", false, null),
                        SizedBox(height: screenHeight * 0.03),
                        fillupTextField("Last Name", lastName ?? "User", false, null),
                        SizedBox(height: screenHeight * 0.03),
                        fillupTextField("Email", email ?? "User Email", false, null),
                        SizedBox(height: screenHeight * 0.03),
                        fillupTextField("Mobile Number", "", true, _mobileNumberController),
                        SizedBox(height: screenHeight * 0.04),
                        GestureDetector(
                          onTap: submit,
                          child: Container(
                            child: SmallButton("Submit"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Loading indicator
          if (_isLoading)
            Container(
              color: Colors.black54, // Semi-transparent background
              child: Center(
                child: CircularProgressIndicator(), // Circular loading indicator
              ),
            ),
        ],
      ),
    );
  }
}
