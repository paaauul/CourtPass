import 'package:court_pass/screens/pages/sports_person/activities/activities_contents/ongoing.dart';
import 'package:court_pass/screens/pages/sports_person/activities/activities_contents/upcoming.dart';
import 'package:court_pass/screens/pages/sports_person/activities/activities_contents/pending.dart';
import 'package:court_pass/screens/pages/sports_person/history/history.dart';
import 'package:court_pass/screens/pages/sports_person/home/home.dart';
import 'package:court_pass/screens/pages/sports_person/messaging/messages.dart';
import 'package:court_pass/screens/pages/sports_person/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Activities extends StatefulWidget {
  const Activities({super.key});

  @override
  State<Activities> createState() => _ActivitiesState();
}

class _ActivitiesState extends State<Activities> {

  int selectedPageActivity = 0;

  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    Navigator.of(context).pushReplacement(PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation){
        switch (index) {
          case 0:
            return const Home();
          case 1:
            return const Activities();
          case 2:
            return const HistoryPage();
          case 3:
            return const Messages();
          case 4:
            return const ProfilePage();
          default:
            return const Home();
        }
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = 0.0;
      const end = 1.0;
      const curve = Curves.easeInOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var opacityAnimation = animation.drive(tween);

      return FadeTransition(
        opacity: opacityAnimation,
        child: child,
      );
    },
    transitionDuration: const Duration(milliseconds: 300),
    reverseTransitionDuration: const Duration(milliseconds: 300),
    ));
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFFFFAFA),

      //BOTTOM NAV BAR
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFFFFAFA),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 0),
              color: Color(0x2813131A),
              blurRadius: 10
            )
          ]
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color(0xFFFFFAFA),
          selectedItemColor: const Color(0xFFFF6F64),
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: TextStyle(
            fontFamily: "Poppins",
            fontSize: screenWidth * 0.03
          ),
          unselectedLabelStyle: TextStyle(
            fontFamily: "Poppins",
            fontSize: screenWidth * 0.028
          ),
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.event),
              label: 'Activities',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: 'Messages',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),

      body: Stack(
        children: [
          // TOP BAR
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: screenHeight * 0.173,
              width: screenWidth,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFFF4D82),
                    Color(0xFFFF6F64),
                  ],
                  stops: [0, 0.4],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x13131A),
                    offset: Offset(0, 2),
                    blurRadius: 4
                  )
                ]
              ),
              child: Column(
                children: [
                  // SEARCH ICON AND LOGO
                  Padding(
                    padding: EdgeInsets.only(right: screenWidth * 0.04, left: screenWidth * 0.04, top: screenWidth * 0.14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: screenWidth * 0.1),
                        // LOGO (centered)
                        SvgPicture.asset(
                          'assets/icons/court_pass_white.svg',
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
                              selectedPageActivity = 0;
                            });
                          },
                          child: Text(
                            "Pending Requests",
                            style: TextStyle(
                              color: selectedPageActivity == 0
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
                              selectedPageActivity = 1;
                            });
                          },
                          child: Text(
                            "Upcoming",
                            style: TextStyle(
                              color: selectedPageActivity == 1
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
                              selectedPageActivity = 2;
                            });
                          },
                          child: Text(
                            "Ongoing",
                            style: TextStyle(
                              color: selectedPageActivity == 2
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
            top: screenHeight * 0.2,
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
    switch (selectedPageActivity) {
      case 0:
        return const Pending(); // Display Pending Requests content
      case 1:
        return const Upcoming(); // Display Upcoming content
      case 2:
        return const Ongoing(); // Display Ongoing content
      default:
        return Container(); // Default empty container
    }
  }
}