import 'package:court_pass/custom%20widgets/buttons/back_buttons.dart';
import 'package:court_pass/custom%20widgets/buttons/custom_button.dart';
import 'package:court_pass/custom%20widgets/buttons/positive_button.dart';
import 'package:court_pass/custom%20widgets/selector/sport_selector.dart';
import 'package:court_pass/screens/pages/facility/add_activity/activity_schedule.dart';
import 'package:court_pass/screens/pages/sports_person/requesting/schedule.dart';
import 'package:flutter/material.dart';
import 'package:court_pass/classes/sport.dart';
import 'package:court_pass/classes/sports.dart';
import 'package:court_pass/custom%20widgets/text_fields/request_textfield.dart';
import 'package:court_pass/custom%20widgets/text_fields/request_uneditable_textfield.dart';
import 'package:flutter/scheduler.dart';

class AddActivity extends StatefulWidget {
  const AddActivity({super.key});

  @override
  State<AddActivity> createState() => _AddActivityState();
}

class _AddActivityState extends State<AddActivity> {
  final Sports sports = Sports();
  Sport selectedSport = Sports().sports.first;

  void _updateSelectedSport(String sportName) {
    setState(() {
      selectedSport = sports.sports.firstWhere((sport) => sport.sportName == sportName);
    });
  }

  @override
  Widget build(BuildContext context) {

    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFFFFAFA),
      body: Stack(
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

          //BACK BUTTON
          Positioned(
            top: screenWidth * 0.11, left: screenWidth * 0.04,
            child: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle
                ),
                width: 30, height: 30,
                child: Icon(
                  Icons.arrow_back,
                  color: const Color(0xFF13131A),
                  size: screenWidth * 0.08,
                ),
              )
            ),
          ),

          //TITLE
          Positioned(
            top: screenWidth * 0.24, left: screenWidth * 0.06,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  "Add Activity",
                  style: TextStyle(
                    color: const Color(0xFF2D2D35),
                    fontFamily: "Poppins",
                    fontSize: screenWidth * 0.08,
                    fontWeight: FontWeight.w800
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.01),
                  child: Text(
                    "Kindly fill-up necessary details",
                    style: TextStyle(
                      color: const Color(0xFF4F4F4F),
                      fontFamily: "Poppins",
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ),

              ],
            )
          ),

          // SPORTS
          Positioned(
            top: screenWidth * 0.45,
            left: screenWidth * 0.033,
            right: 0,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: sports.sports.map((sport) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 16),
                    child: SportSelector(
                      sport: sport,
                      isSelected: selectedSport.sportName == sport.sportName,
                      onSelected: _updateSelectedSport,
                    ),
                  );
                }).toList(),
              ),
            ),
          ),

          //FILL UP
          Positioned(
            top: screenWidth * 0.65,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  //requestTextField("Activity Name", ""),
                  SizedBox(height: screenWidth * 0.06),

                 // requestTextField("Name", ""),
                  SizedBox(height: screenWidth * 0.07),

                  //requestTextField("Organization Name (Optional)", ""),
                  SizedBox(height: screenWidth * 0.06),

                  //requestUneditableTextfield("Sport", selectedSport.sportName),
                  SizedBox(height: screenWidth * 0.06),

                  //requestTextField("Purpose", ""),
                  SizedBox(height: screenWidth * 0.06),

                  //END OF COLUMN
                ],
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: screenWidth * 0.03),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

                //VIEW SCHEDULES
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ActivitySchedule()),
                    );
                  },
                  child: CustomButton("View Schedules",const Color(0xFF272727),const Color(0xFFFFFAFA))
                ),

                SizedBox(height: screenWidth * 0.02)
                ],
              )
            )
        )

        //END
        ],
      ),
    );
  }
}
