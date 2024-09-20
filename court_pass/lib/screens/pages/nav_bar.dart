import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  final Function(int) onTap;

  const NavBar({super.key, required this.onTap});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> _items = [
    {'icon': Icons.home, 'label': 'Home'},
    {'icon': Icons.event, 'label': 'Activities'},
    {'icon': Icons.history, 'label': 'History'},
    {'icon': Icons.message, 'label': 'Messages'},
    {'icon': Icons.person, 'label': 'Profile'},
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: _items.map((item) {
        int index = _items.indexOf(item);
        return BottomNavigationBarItem(
          icon: Icon(
            index == _selectedIndex
                ? item['icon'] // Use filled icon here (replace with filled version)
                : item['icon'],
            color: index == _selectedIndex ? Color(0xFFFF6F64) : Color(0xFF6C6C6C),
          ),
          label: item['label'],
          backgroundColor: Color(0xFFFFFAFA),
        );
      }).toList(),
      currentIndex: _selectedIndex,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
        widget.onTap(index);
      },
      selectedItemColor: Color(0xFFFF6F64),
      unselectedItemColor: Color(0xFF6C6C6C),
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      elevation: 5,
    );
  }
}
