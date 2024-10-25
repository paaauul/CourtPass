import 'package:court_pass/classes/sport.dart';
import 'package:court_pass/classes/sports.dart';
import 'package:court_pass/custom%20widgets/selector/sport_selector.dart';
import 'package:court_pass/database%20services/facility_database_service.dart';
import 'package:court_pass/screens/pages/sports_person/activities/activities.dart';
import 'package:court_pass/screens/pages/sports_person/history/history.dart';
import 'package:court_pass/screens/pages/sports_person/home/facility_details.dart';
import 'package:court_pass/screens/pages/sports_person/home/facility_home_preview.dart';
import 'package:court_pass/screens/pages/sports_person/messaging/messages.dart';
import 'package:court_pass/screens/pages/sports_person/profile/profile.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _facilityDatabaseService = FacilityDatabaseService();

  final Sports sports = Sports();
  Sport selectedSport = Sports().sports.first;

  void _updateSelectedSport(String sportName) {
    setState(() {
      selectedSport =
          sports.sports.firstWhere((sport) => sport.sportName == sportName);
    });
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    Navigator.of(context).pushReplacement(PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
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

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
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
      backgroundColor: const Color(0xFFF5F5F5),

      //BOTTOM NAV BAR
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(color: Color(0xFFFFFAFA), boxShadow: [
          BoxShadow(
              offset: Offset(0, 0), color: Color(0x2813131A), blurRadius: 10)
        ]),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color(0xFFFFFAFA),
          selectedItemColor: const Color(0xFFFF6F64),
          unselectedItemColor: Colors.grey,
          selectedLabelStyle:
              TextStyle(fontFamily: "Poppins", fontSize: screenWidth * 0.03),
          unselectedLabelStyle:
              TextStyle(fontFamily: "Poppins", fontSize: screenWidth * 0.028),
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
          // GRADIENT
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              width: screenWidth,
              height: screenHeight * 0.74,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFFF6F64),
                    Color(0xFFFFD2C1),
                    Color(0xFFF5F5F5),
                  ],
                  stops: [0.0, 0.56, 1],
                ),
              ),
            ),
          ),

          //TOP PART
          Positioned(
              top: screenWidth * 0.18,
              left: screenWidth * 0.06,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //HI JERRY
                  Text(
                    "Hi Jerry!",
                    style: TextStyle(
                        color: const Color(0xFF2D2D35),
                        fontFamily: "Poppins",
                        fontSize: screenWidth * 0.08,
                        fontWeight: FontWeight.w800),
                  ),

                  //BOOK NOW
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.002),
                    child: Text(
                      "Book your Court Pass now!",
                      style: TextStyle(
                          color: const Color(0xFF4F4F4F),
                          fontFamily: "Poppins",
                          fontSize: screenWidth * 0.038,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              )),

          Positioned(
            top: screenWidth * 0.38,
            left: 0,
            right: 0,
            child:

                //SEARCH
                Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  width: screenWidth * 0.9,
                  height: screenWidth * 0.115,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFAFA),
                    border: Border.all(
                      color: const Color(0xFF13131A),
                      width: 0.2,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(36, 73, 73, 116),
                        blurRadius: 8,
                        offset: Offset(0, 2),
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: TextField(
                    style: const TextStyle(color: Color(0xFF13131A)),
                    decoration: InputDecoration(
                        hintText: 'Search for facilities...',
                        hintStyle: TextStyle(
                            color: const Color(0xFF797979),
                            fontSize: screenWidth * 0.036,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w300),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 17, vertical: 14),
                        border: InputBorder.none,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(left: 12, right: 12),
                          child: Icon(
                            Icons.search,
                            color: const Color(0xFFBBBBBB),
                            size: screenWidth * 0.07,
                          ),
                        )),
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            top: screenWidth * 0.57,
            left: 0,
            right: 0,
            child: Column(
              children: [
                //TITLE
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.063),
                    child: Text(
                      'Search for Facilities',
                      style: TextStyle(
                          color: const Color(0xFF2D2D35),
                          fontFamily: "Poppins",
                          fontSize: screenWidth * 0.041,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                SizedBox(height: screenHeight * 0.016),

                //SPORTS SELECTOR
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.04),
                    child: Row(
                      children: sports.sports.map((sport) {
                        return Padding(
                          padding: EdgeInsets.only(
                              left: screenWidth * 0.012,
                              bottom: screenWidth * 0.04),
                          child: SportSelector(
                            sport: sport,
                            isSelected:
                                selectedSport.sportName == sport.sportName,
                            onSelected: _updateSelectedSport,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),

                SizedBox(height: screenHeight * 0.005),

                StreamBuilder(
                  stream: _facilityDatabaseService.getFacility(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }

                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return const Center(
                          child: Text('No facilities available.'));
                    }

                    final facilities = snapshot.data!.docs;

                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          SizedBox(width: screenWidth * 0.05),

                          ...facilities.map((facility) {
                            final documentID = facility.id;
                            final facilityName = facility['facilityName'];

                            return Padding(
                              padding: EdgeInsets.only(
                                right: screenWidth * 0.04,
                                bottom: screenWidth * 0.2,
                              ),
                              child: FacilityHomePreview(
                                documentId: documentID,
                                name: facilityName,
                                onTap: (){
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) => FacilityDetails(
                                      documentId: documentID,
                                      facilityName: facilityName
                                    ))
                                  );
                                },
                              ),
                            );
                          }).toList(),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          )

          //END OF STACK
        ],
      ),
    );
  }
}
