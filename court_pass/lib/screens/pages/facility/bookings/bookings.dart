import 'package:court_pass/screens/pages/facility/bookings/ongoing_bookings.dart';
import 'package:court_pass/screens/pages/facility/bookings/upcoming_bookings.dart';
import 'package:court_pass/screens/pages/sports_person/activities/activities_contents/ongoing.dart';
import 'package:court_pass/screens/pages/sports_person/activities/activities_contents/upcoming.dart';
import 'package:court_pass/screens/pages/sports_person/activities/activities_contents/pending.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Bookings extends StatefulWidget {
  const Bookings({super.key});

  @override
  State<Bookings> createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFFFFAFA),
      body: Stack(
        children: [
          // TOP BAR
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: screenHeight * 0.158,
              width: screenWidth,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFFF4D82),
                    Color(0xFFFF6F64),
                  ],
                  stops: [0, 0.4],
                ),
              ),
              child: Column(
                children: [
                  // SEARCH ICON AND LOGO
                  Padding(
                    padding: EdgeInsets.only(right: screenWidth * 0.04, left: screenWidth * 0.04, top: screenWidth * 0.11),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: screenWidth * 0.1),
                        // LOGO (centered)
                        SvgPicture.asset(
                          'assets/icons/court_pass.svg',
                          height: screenHeight * 0.04,
                        ),
                        // SEARCH ICON
                        Icon(
                          size: screenWidth * 0.1,
                          Icons.search,
                          color: const Color(0xFFFFFAFA),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.003),

                  // TEXT SELECTORS
                  Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = 0;
                            });
                          },
                          child: Text(
                            "Pending Requests",
                            style: TextStyle(
                              color: selectedIndex == 0
                                  ? const Color(0xFFFFFAFA)
                                  : const Color(0x656F6F6F),
                              fontSize: screenWidth * 0.04,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = 1;
                            });
                          },
                          child: Text(
                            "Upcoming",
                            style: TextStyle(
                              color: selectedIndex == 1
                                  ? const Color(0xFFFFFAFA)
                                  : const Color(0x656F6F6F),
                              fontSize: screenWidth * 0.04,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = 2;
                            });
                          },
                          child: Text(
                            "Ongoing",
                            style: TextStyle(
                              color: selectedIndex == 2
                                  ? const Color(0xFFFFFAFA)
                                  : const Color(0x656F6F6F),
                              fontSize: screenWidth * 0.04,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // SCROLLABLE CONTENT BELOW TOP BAR
          Positioned(
            top: screenHeight * 0.17,
            left: 0,
            right: 0,
            bottom: 0,
            child: _getSelectedContent(),
          ),
        ],
      ),
    );
  }

  // Dynamic content loader based on selected index
  Widget _getSelectedContent() {
    switch (selectedIndex) {
      case 0:
        return const Pending(); // Display Pending Requests content
      case 1:
        return const UpcomingBookings(); // Display Upcoming content
      case 2:
        return const OngoingBookings(); // Display Ongoing content
      default:
        return Container(); // Default empty container
    }
  }
}