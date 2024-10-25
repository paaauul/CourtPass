import 'package:court_pass/screens/pages/sports_person/activities/activities.dart';
import 'package:court_pass/screens/pages/sports_person/history/past_activity.dart';
import 'package:court_pass/screens/pages/sports_person/home/home.dart';
import 'package:court_pass/screens/pages/sports_person/messaging/message.dart';
import 'package:court_pass/screens/pages/sports_person/messaging/messages.dart';
import 'package:court_pass/screens/pages/sports_person/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {

  DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  int _selectedIndex = 2;

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

    String formattedDate = DateFormat('MMMM d, yyyy').format(_selectedDate);

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
            top: 0, left: 0, right: 0,
            child: Container(
              height: screenHeight * 0.14,
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
              child: Padding(
                padding: EdgeInsets.only(right: screenWidth * 0.04, left: screenWidth * 0.04, top: screenWidth * 0.11),
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
              )   
            ),
          ),

          // SELECT DATE
          Positioned(
            top: screenHeight * 0.16,
            left: 0, right: 0,
            child: Center(
              child: Text(
                "Select Date",
                style: TextStyle(
                  color: const Color(0xFF13131A),
                  fontFamily: "Poppins",
                  fontSize: screenWidth * 0.055,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // DATE PICKER
          Positioned(
            top: screenHeight * 0.183,
            left: 0, right: 0,
            child: Center(
              child: GestureDetector(
                onTap: () => _selectDate(context),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //PREVIOUS DAY
                    IconButton(
                      icon: const Icon(Icons.arrow_left, color: Color(0xFFFF6F64)),
                      iconSize: screenWidth * 0.08,
                      onPressed: () {
                        setState(() {
                          _selectedDate = _selectedDate.subtract(const Duration(days: 1));
                        });
                      },
                    ),

                    //SELECTED DATE
                    Text(
                      formattedDate,
                      style: TextStyle(
                        color: const Color(0xFF6A6A6A),
                        fontFamily: "Poppins",
                        fontSize: screenWidth * 0.048,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    //NEXT DAY
                    IconButton(
                      icon: const Icon(Icons.arrow_right, color: Color(0xFFFF6F64)),
                      iconSize: screenWidth * 0.08,
                      onPressed: () {
                        setState(() {
                          _selectedDate = _selectedDate.add(const Duration(days: 1));
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),

          // ACTIVITIES
          Positioned(
            top: screenHeight * 0.24,
            left: 0,
            right: 0,
            bottom: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
              child: ListView.builder(
                itemCount: 10, // Number of items
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      PastActivity(),
                      SizedBox(height: screenHeight * 0.01), // Spacer
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
