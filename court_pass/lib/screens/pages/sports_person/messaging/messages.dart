import 'package:court_pass/screens/pages/sports_person/activities/activities.dart';
import 'package:court_pass/screens/pages/sports_person/history/history.dart';
import 'package:court_pass/screens/pages/sports_person/home/home.dart';
import 'package:court_pass/screens/pages/sports_person/messaging/convo.dart';
import 'package:court_pass/screens/pages/sports_person/messaging/messages.dart';
import 'package:court_pass/screens/pages/sports_person/profile/profile.dart';
import 'package:flutter/material.dart';

class Messages extends StatefulWidget {
  const Messages({super.key});

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {

  int _selectedIndex = 3;

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
          Positioned(
            top: screenHeight * 0.068,
            left: screenWidth * 0.07,
            child: Text(
              "Messages",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: screenWidth * 0.072,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          //SEARCH
          Positioned(
            top: screenHeight * 0.076,
            right: screenWidth * 0.07,
            child: GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.search,
                size: screenWidth * 0.08,
              ),
            ),
          ),
          
          Positioned(
            top: screenHeight * 0.14,
            left: 0,
            right: 0,
            bottom: 0,
            child: ListView.builder(
              padding: EdgeInsets.only(
                top: 0,
                bottom: screenHeight * 0.02,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.05,
                    vertical: screenHeight * 0.007,
                  ),
                  child: const Convo(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}