import 'package:flutter/material.dart';
import 'package:court_pass/screens/pages/sports_person/home/home.dart';
import 'package:court_pass/screens/pages/sports_person/activities/activities.dart';
import 'package:court_pass/screens/pages/sports_person/history/history.dart';
import 'package:court_pass/screens/pages/sports_person/messaging/messages.dart';
import 'package:court_pass/screens/pages/sports_person/profile/profile.dart';

class UserNavBar extends StatefulWidget {
  const UserNavBar({Key? key}) : super(key: key);

  @override
  State<UserNavBar> createState() => _UserNavBarState();
}

class _UserNavBarState extends State<UserNavBar> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const Home(),
    const Activities(),
    const HistoryPage(),
    const Messages(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFFFFAFA),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF13131A).withOpacity(0.2),
              offset: const Offset(0, 2),
              blurRadius: 7,
            ),
          ],
        ),
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: _selectedIndex == 0 ? const Color(0xFFFF6F64) : const Color(0xFFAAAAAA),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.sports,
                color: _selectedIndex == 1 ? const Color(0xFFFF6F64) : const Color(0xFFAAAAAA),
              ),
              label: 'Activities',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.history,
                color: _selectedIndex == 2 ? const Color(0xFFFF6F64) : const Color(0xFFAAAAAA),
              ),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.message,
                color: _selectedIndex == 3 ? const Color(0xFFFF6F64) : const Color(0xFFAAAAAA),
              ),
              label: 'Messages',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: _selectedIndex == 4 ? const Color(0xFFFF6F64) : const Color(0xFFAAAAAA),
              ),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: const Color(0xFFFF6F64),
          unselectedItemColor: const Color(0xFFAAAAAA),
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}
