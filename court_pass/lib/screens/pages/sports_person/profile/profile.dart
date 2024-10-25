import 'package:court_pass/screens/auth/user_selection.dart';
import 'package:court_pass/screens/pages/sports_person/activities/activities.dart';
import 'package:court_pass/screens/pages/sports_person/history/history.dart';
import 'package:court_pass/screens/pages/sports_person/home/home.dart';
import 'package:court_pass/screens/pages/sports_person/messaging/messages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:court_pass/custom%20widgets/backgrounds/photos_backgrounds.dart';
import 'package:court_pass/custom%20widgets/text_fields/textfield_with_edit.dart';
import 'package:court_pass/database%20services/sports_person_database_service.dart';
import 'profile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  int _selectedIndex = 4;
  
  final SportsPersonDatabaseService _sportsPersonDatabaseService = SportsPersonDatabaseService();
  String? firstName;
  String? lastName;
  String? email;
  String? mobileNumber;

  @override
  void initState() {
    super.initState();
    fetchUserFirstData();
  }

  Future<void> fetchUserFirstData() async {
    String? userFirstName = await _sportsPersonDatabaseService.getCurrentUserFirstName();
    String? userLastName = await _sportsPersonDatabaseService.getCurrentUserLastName();
    String? userEmail = await _sportsPersonDatabaseService.getCurrentUserEmail();
    String? userMobileNumber = await _sportsPersonDatabaseService.getCurrentUserMobileNumber();

    setState(() {
      firstName = userFirstName;
      lastName = userLastName;
      email = userEmail;
      mobileNumber = userMobileNumber;
    });
  }

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
      resizeToAvoidBottomInset: false,
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
                    decoration: const BoxDecoration(
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
                  const SizedBox(height: 10),

                  // NAME
                  Text(
                    '${firstName ?? "First Name"} $lastName',
                    style: TextStyle(
                      fontFamily: "Poppins",
                      color: const Color(0xFF13131A),
                      fontSize: screenWidth * 0.065,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // LOCATION
                  Text(
                    'Cagayan de Oro, Philippines',
                    style: TextStyle(
                      fontFamily: "Poppins",
                      color: const Color(0xFF5B5B5B),
                      fontSize: screenWidth * 0.035,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
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
                    // ACCOUNT DETAILS
                    Container(
                      margin: EdgeInsets.only(left: screenWidth * 0.022),
                      child: Text(
                        'Account Details',
                        style: TextStyle(
                          fontFamily: "Poppins",
                          color: const Color(0xFF13131A),
                          fontSize: screenWidth * 0.045,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    TextfieldWithEdit("First Name", firstName ?? ""),
                    const SizedBox(height: 20),

                    TextfieldWithEdit("Last Name", lastName ?? ""),
                    const SizedBox(height: 20),

                    TextfieldWithEdit("Email", email ?? ""),
                    const SizedBox(height: 20),

                    TextfieldWithEdit("Mobile Number", "0${mobileNumber ?? ''}"),
                    const SizedBox(height: 30),

                    // SETTINGS
                    Container(
                      margin: EdgeInsets.only(left: screenWidth * 0.024),
                      child: Text(
                        'Settings',
                        style: TextStyle(
                          fontFamily: "Poppins",
                          color: const Color(0xFF13131A),
                          fontSize: screenWidth * 0.045,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    MaterialButton(
                      onPressed: (){
                        FirebaseAuth.instance.signOut;
                        Navigator.push(context, MaterialPageRoute(builder: (context) => UserSelectionPage()));
                      },
                      color: const Color(0xFFFF6F64),
                      child: Text('Log Out'),
                    )
                    // Add additional settings options here
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
