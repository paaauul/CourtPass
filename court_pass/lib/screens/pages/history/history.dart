import 'package:court_pass/screens/pages/activities/activities.dart';
import 'package:court_pass/screens/pages/history/history.dart';
import 'package:court_pass/screens/pages/history/past_activity.dart';
import 'package:court_pass/screens/pages/home.dart';
import 'package:court_pass/screens/pages/messaging/messages.dart';
import 'package:court_pass/screens/pages/nav_bar.dart';
import 'package:court_pass/screens/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    String formattedDate = DateFormat('MMMM d, yyyy').format(_selectedDate);

    return Scaffold(
      backgroundColor: Color(0xFFFFFAFA),
      body: Stack(
        children: [
          // TOP BAR
          Positioned(
            top: 0, left: 0, right: 0,
            child: Container(
              height: screenHeight * 0.13,
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
              // SEARCH
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.only(right: screenWidth * 0.05, top: screenWidth * 0.1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        size: screenWidth * 0.1,
                        Icons.search,
                        color: const Color(0xFFFFFAFA),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // SELECT DATE
          Positioned(
            top: screenHeight * 0.15,
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
            top: screenHeight * 0.175,
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
            top: screenHeight * 0.23,
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
                      SizedBox(height: screenHeight * 0.02), // Spacer
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
