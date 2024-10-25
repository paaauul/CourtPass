import 'package:court_pass/custom%20widgets/buttons/positive_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class ActivitySchedule extends StatefulWidget {
  const ActivitySchedule({super.key});

  @override
  State<ActivitySchedule> createState() => _ActivityScheduleState();
}

class _ActivityScheduleState extends State<ActivitySchedule> {
  List<DateTime> _selectedDates = [];

  // Method to open the multi-date picker modal
  Future<void> _selectDates(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Container(
              padding: const EdgeInsets.all(16.0),
              height: MediaQuery.of(context).size.height * 0.55,
              child: Column(
                children: [
                  const Text(
                    'Select Dates',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TableCalendar(
                    firstDay: DateTime(2000),
                    lastDay: DateTime(2101),
                    focusedDay: DateTime.now(),
                    selectedDayPredicate: (day) => _selectedDates.contains(day),
                    onDaySelected: (selectedDay, focusedDay) {
                      setModalState(() {
                        if (_selectedDates.contains(selectedDay)) {
                          _selectedDates.remove(selectedDay);
                        } else {
                          _selectedDates.add(selectedDay);
                        }
                      });
                    },
                    calendarStyle: CalendarStyle(
                      selectedDecoration: BoxDecoration(
                        color: const Color(0xFFFF6F64), // Color for selected date
                        shape: BoxShape.circle,
                      ),
                      selectedTextStyle: const TextStyle(
                        color: Colors.white, // Text color for selected date
                      ),
                      defaultDecoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      defaultTextStyle: const TextStyle(
                        color: Colors.black,
                      ),
                      todayDecoration: BoxDecoration(
                        color: const Color(0xFFFFD2C1), // Color for today
                        shape: BoxShape.circle,
                      ),
                      todayTextStyle: const TextStyle(
                        color: Colors.black, // Text color for today
                      ),
                    ),
                    availableCalendarFormats: const {CalendarFormat.month: 'Month'},
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: PositiveButton("Confirm"),
                  ),
                ],
              ),
            );
          },
        );
      },
    ).then((_) {
      // Update the hint text when the modal is closed
      setState(() {});
    });
  }

  // Method to format the selected dates into a human-readable string
  String _formatSelectedDates() {
    if (_selectedDates.isEmpty) return 'Select a Date';
    _selectedDates.sort();

    List<String> formattedRanges = [];
    List<DateTime> rangeBuffer = [_selectedDates.first];

    for (int i = 1; i < _selectedDates.length; i++) {
      if (_selectedDates[i].difference(_selectedDates[i - 1]).inDays == 1) {
        rangeBuffer.add(_selectedDates[i]);
      } else {
        formattedRanges.add(_formatRange(rangeBuffer));
        rangeBuffer = [_selectedDates[i]];
      }
    }
    formattedRanges.add(_formatRange(rangeBuffer));

    return formattedRanges.join(', ');
  }

  // Helper method to format a range of dates
  String _formatRange(List<DateTime> range) {
    if (range.length == 1) {
      return DateFormat('MMMM d').format(range.first);
    } else {
      String start = DateFormat('d').format(range.first);
      String end = DateFormat('d, yyyy').format(range.last);
      return '${DateFormat('MMMM').format(range.first)} $start-$end';
    }
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

          // BACK BUTTON
          Positioned(
            top: screenWidth * 0.11,
            left: screenWidth * 0.04,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                decoration: const BoxDecoration(shape: BoxShape.circle),
                width: 30,
                height: 30,
                child: Icon(
                  Icons.arrow_back,
                  color: const Color(0xFF13131A),
                  size: screenWidth * 0.08,
                ),
              ),
            ),
          ),

          // TITLE
          Positioned(
            top: screenWidth * 0.24,
            left: screenWidth * 0.06,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Schedules for Badminton",
                  style: TextStyle(
                    color: const Color(0xFF2D2D35),
                    fontFamily: "Poppins",
                    fontSize: screenWidth * 0.063,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.01),
                  child: Text(
                    "Choose a slot to reserve",
                    style: TextStyle(
                      color: const Color(0xFF4F4F4F),
                      fontFamily: "Poppins",
                      fontSize: screenWidth * 0.038,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            top: screenWidth * 0.47,
            left: screenWidth * 0.06,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SELECT DATE
                Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.01),
                  child: Text(
                    "Select Date:",
                    style: TextStyle(
                      color: const Color(0xFF2D2D34),
                      fontFamily: "Poppins",
                      fontSize: screenWidth * 0.043,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Center(
                  child: GestureDetector(
                    onTap: () => _selectDates(context),
                    child: Container(
                      width: screenWidth * 0.88,
                      height: screenWidth * 0.14,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFAFA),
                        border: Border.all(
                          color: const Color(0xFF13131A),
                          width: 0.2,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(36, 73, 73, 116),
                            blurRadius: 8,
                            offset: Offset(0, 2),
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          _formatSelectedDates(),
                          style: TextStyle(
                            color: const Color(0xFF929292),
                            fontFamily: "Poppins",
                            fontSize: screenWidth * 0.042,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.015),
                Row(
                  children: [
                    Icon(
                      Icons.error,
                      color: const Color(0xFF78E820),
                      size: screenWidth * 0.045,
                    ),
                    SizedBox(width: screenWidth * 0.01),
                    Padding(
                      padding: EdgeInsets.only(
                        top: screenWidth * 0.004,
                      ),
                      child: Text(
                        'Multiple dates can be selected',
                        style: TextStyle(
                          color: const Color(0xFF67C020),
                          fontSize: screenWidth * 0.037,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                
                SizedBox(height: screenHeight * 0.04),

                // SELECT TIME
                Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.01),
                  child: Text(
                    "Select Time:",
                    style: TextStyle(
                      color: const Color(0xFF2D2D34),
                      fontFamily: "Poppins",
                      fontSize: screenWidth * 0.043,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                SizedBox(height: screenHeight * 0.02),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
