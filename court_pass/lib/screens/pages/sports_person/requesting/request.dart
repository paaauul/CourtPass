import 'package:court_pass/custom widgets/buttons/custom_button.dart';
import 'package:court_pass/custom widgets/selector/sport_selector.dart';
import 'package:court_pass/screens/pages/sports_person/requesting/schedule.dart';
import 'package:flutter/material.dart';
import 'package:court_pass/classes/sport.dart';
import 'package:court_pass/classes/sports.dart';
import 'package:court_pass/custom widgets/text_fields/request_textfield.dart';
import 'package:court_pass/custom widgets/text_fields/request_uneditable_textfield.dart';

class Request extends StatefulWidget {
  const Request({super.key});

  @override
  State<Request> createState() => _RequestState();
}

class _RequestState extends State<Request> {
  final Sports sports = Sports();
  Sport selectedSport = Sports().sports.first;

  final TextEditingController activityNameController = TextEditingController();
  final TextEditingController organizationNameController =
      TextEditingController();
  final TextEditingController purposeController = TextEditingController();

  void _updateSelectedSport(String sportName) {
    setState(() {
      selectedSport =
          sports.sports.firstWhere((sport) => sport.sportName == sportName);
    });
  }

  bool _areFieldsFilled() {
    return activityNameController.text.isNotEmpty &&
        organizationNameController.text.isNotEmpty &&
        purposeController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFFFFAFA),
      resizeToAvoidBottomInset:
          true, // Ensure the screen resizes with the keyboard
      body: SingleChildScrollView(
        // Wrap body with SingleChildScrollView
        child: Stack(
          children: [
            // GRADIENT
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                width: screenWidth,
                height: screenHeight * 0.32,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFFF6F64),
                      Color(0xFFFFD2C1),
                      Color(0xFFFFFAFA),
                    ],
                    stops: [0.0, 0.56, 1],
                  ),
                ),
              ),
            ),

            // CONTENT
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: screenWidth * 0.12),
                  child: Column(
                    children: [
                      // BACK BUTTON
                      Padding(
                        padding: EdgeInsets.only(left: screenWidth * 0.048),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              width: 30,
                              height: 30,
                              child: Icon(
                                Icons.arrow_back,
                                color: const Color(0xFF13131A),
                                size: screenWidth * 0.08,
                              ),
                            ),
                          ),
                        ),
                      ),

                      // TITLE
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: screenWidth * 0.04,
                              left: screenWidth * 0.06),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Request Reservation",
                                style: TextStyle(
                                  color: const Color(0xFF2D2D35),
                                  fontFamily: "Poppins",
                                  fontSize: screenWidth * 0.075,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              Text(
                                "Kindly fill-up necessary details",
                                style: TextStyle(
                                  color: const Color(0xFF4F4F4F),
                                  fontFamily: "Poppins",
                                  fontSize: screenWidth * 0.038,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: screenHeight * 0.006),

                      // SPORTS
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            SizedBox(width: screenWidth * 0.034),
                            ...sports.sports.map((sport) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, top: 8.0, bottom: 16),
                                child: SportSelector(
                                  sport: sport,
                                  isSelected: selectedSport.sportName ==
                                      sport.sportName,
                                  onSelected: _updateSelectedSport,
                                ),
                              );
                            }).toList(),
                          ],
                        ),
                      ),

                      SizedBox(height: screenHeight * 0.01),

                      // FILL UP
                      Column(
                        children: [
                          requestTextField(
                              "Activity Name", "", activityNameController),
                          SizedBox(height: screenWidth * 0.06),
                          requestUneditableTextfield("Name", "Jerry Layug"),
                          SizedBox(height: screenWidth * 0.07),
                          requestTextField("Organization Name (Optional)", "",
                              organizationNameController),
                          SizedBox(height: screenWidth * 0.06),
                          requestUneditableTextfield(
                              "Sport", selectedSport.sportName),
                          SizedBox(height: screenWidth * 0.06),
                          requestTextField("Purpose", "", purposeController),
                          SizedBox(height: screenWidth * 0.06),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenWidth * 0.14),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // VIEW SCHEDULES
                      GestureDetector(
                        onTap: _areFieldsFilled()
                            ? () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Schedule(
                                      activityName: activityNameController.text,
                                      userName: "Jerry Layug",
                                      organizationName:
                                          organizationNameController.text,
                                      selectedSportName:
                                          selectedSport.sportName,
                                      purpose: purposeController.text,
                                    ),
                                  ),
                                );
                              }
                            : null,
                        child: CustomButton(
                          "View Schedules",
                          const Color(0xFF272727),
                          const Color(0xFFFFFAFA),
                          isEnabled: _areFieldsFilled(),
                          nextPage: Schedule(
                            activityName: activityNameController.text,
                            userName: "Jerry Layug",
                            organizationName: organizationNameController.text,
                            selectedSportName: selectedSport.sportName,
                            purpose: purposeController.text,
                          ),
                        ),
                      ),
                      SizedBox(height: screenWidth * 0.02),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
