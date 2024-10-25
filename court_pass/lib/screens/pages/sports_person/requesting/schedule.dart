import 'package:court_pass/custom%20widgets/buttons/custom_button.dart';
import 'package:court_pass/custom%20widgets/buttons/positive_button.dart';
import 'package:court_pass/screens/pages/sports_person/requesting/summary.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class Schedule extends StatefulWidget {
  final String activityName;
  final String userName;
  final String organizationName;
  final String selectedSportName;
  final String purpose;

  const Schedule({
    Key? key,
    required this.activityName,
    required this.userName,
    required this.organizationName,
    required this.selectedSportName,
    required this.purpose,
  }) : super(key: key);

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  List<DateTime> _selectedDates = [];
  DateTime _focusedDay = DateTime.now();

  List<String> hours = [
    '8 AM - 9 AM',
    '9 AM - 10 AM',
    '10 AM - 11 AM',
    '11 AM - 12 PM',
    '12 PM - 1 PM',
    '1 PM - 2 PM',
    '2 PM - 3 PM',
    '3 PM - 4 PM',
    '4 PM - 5 PM',
    '5 PM - 6 PM',
    '6 PM - 7 PM',
    '7 PM - 8 PM',
  ];

  List<String> courts = ['Court 1', 'Court 2', 'Court 3', 'Court 4'];

  List<List<bool>> _selectedCells = [];

  @override
  void initState() {
    super.initState();
    _selectedCells = List.generate(
        hours.length, (_) => List.generate(courts.length, (_) => false));
  }

  Future<void> _selectDates(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Container(
              padding: const EdgeInsets.all(16.0),
              height: MediaQuery.of(context).size.height * 0.64,
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
                    firstDay: DateTime.now(), // Start from today
                    lastDay: DateTime(2101),
                    focusedDay: _focusedDay,
                    selectedDayPredicate: (day) => _selectedDates.contains(day),
                    onDaySelected: (selectedDay, focusedDay) {
                      // Prevent selection of past dates
                      if (selectedDay.isBefore(DateTime.now())) return;

                      setModalState(() {
                        if (_selectedDates.contains(selectedDay)) {
                          _selectedDates.remove(selectedDay);
                        } else {
                          _selectedDates.add(selectedDay);
                        }
                        _focusedDay = focusedDay;
                      });
                    },
                    calendarStyle: const CalendarStyle(
                      selectedDecoration: BoxDecoration(
                        color: Color(0xFFFF6F64),
                        shape: BoxShape.circle,
                      ),
                      selectedTextStyle: TextStyle(
                        color: Colors.white,
                      ),
                      defaultDecoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      defaultTextStyle: TextStyle(
                        color: Colors.black,
                      ),
                      todayDecoration: BoxDecoration(
                        color: Color(0xFFFFD2C1),
                        shape: BoxShape.circle,
                      ),
                      todayTextStyle: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    availableCalendarFormats: const {
                      CalendarFormat.month: 'Month'
                    },
                    onPageChanged: (focusedDay) {
                      // Ensure focusedDay cannot be in the past
                      if (focusedDay.isBefore(DateTime.now())) {
                        // Reset to today if a past day is focused
                        _focusedDay = DateTime.now();
                      } else {
                        _focusedDay = focusedDay;
                      }
                    },
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

          // CONTENT
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: screenWidth * 0.12),
                  child: Column(
                    children: [
                      // BACK BUTTON
                      Padding(
                        padding: EdgeInsets.only(left: screenWidth * 0.048),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
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
                      ),

                      // TITLE
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: screenWidth * 0.04,
                              left: screenWidth * 0.06),
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
                              Text(
                                "Choose a slot to reserve",
                                style: TextStyle(
                                  color: const Color(0xFF4F4F4F),
                                  fontFamily: "Poppins",
                                  fontSize: screenWidth * 0.038,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenWidth * 0.1),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // SELECT DATE
                    Padding(
                      padding: EdgeInsets.only(left: screenWidth * 0.07),
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

                    SizedBox(height: screenHeight * 0.01),

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
                                blurRadius: 4,
                                offset: Offset(0, 2),
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

                    Padding(
                      padding: EdgeInsets.only(left: screenWidth * 0.06),
                      child: Row(
                        children: [
                          Icon(
                            Icons.error,
                            color: const Color(0xFF78E820),
                            size: screenWidth * 0.045,
                          ),
                          SizedBox(width: screenWidth * 0.0),
                          Padding(
                            padding: EdgeInsets.only(
                              top: screenWidth * 0.004,
                            ),
                            child: Text(
                              'Multiple dates can be selected',
                              style: TextStyle(
                                color: const Color(0xFF67C020),
                                fontSize: screenWidth * 0.036,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.04),

                    // SELECT TIME
                    Padding(
                      padding: EdgeInsets.only(left: screenWidth * 0.07),
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

                    SizedBox(height: screenHeight * 0.01),

                    Center(
                      child: Container(
                        width: screenWidth * 0.88,
                        height: screenWidth * 0.88,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFFAFA),
                          border: Border.all(
                            color: const Color(0xFF13131A),
                            width: 0.3,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(36, 73, 73, 116),
                              blurRadius: 6,
                              offset: Offset(0, 2),
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        // Scrollable container for the table
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                minWidth: screenWidth * 0.88,
                              ),
                              child: Table(
                                border: TableBorder.symmetric(
                                  inside: BorderSide(
                                    color: const Color(0xFF13131A),
                                    width: 0.3,
                                  ),
                                ),
                                columnWidths: {
                                  0: FixedColumnWidth(screenWidth * 0.28),
                                  for (int i = 1; i <= courts.length; i++)
                                    i: FixedColumnWidth(screenWidth * 0.3),
                                },
                                children: [
                                  // Header row for courts
                                  TableRow(
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                    ),
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(8.0),
                                        alignment: Alignment.center,
                                        child: Text(
                                          'HOURS',
                                          style: TextStyle(
                                            color: Color(0xFF13131A),
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Poppins",
                                          ),
                                        ),
                                      ),
                                      ...courts.map((court) => Container(
                                            padding: EdgeInsets.all(8.0),
                                            alignment: Alignment.center,
                                            child: Text(
                                              court,
                                              style: TextStyle(
                                                color: Color(0xFF13131A),
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "Poppins",
                                              ),
                                            ),
                                          )),
                                    ],
                                  ),
                                  // Rows for hours and availability
                                  ...hours.asMap().entries.map((entry) {
                                    int rowIndex = entry.key;
                                    String hour = entry.value;
                                    return TableRow(
                                      decoration: BoxDecoration(
                                        color: rowIndex.isOdd
                                            ? Colors.grey[300]
                                            : Colors.transparent,
                                      ),
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(8.0),
                                          alignment: Alignment.center,
                                          child: Text(
                                            hour,
                                            style: TextStyle(
                                              color: Color(0xFF13131A),
                                              fontSize: screenWidth * 0.03,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Poppins",
                                            ),
                                          ),
                                        ),
                                        // Create cells for each court
                                        ...List.generate(courts.length,
                                            (courtIndex) {
                                          return GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                // Toggle the cell's selected state
                                                _selectedCells[rowIndex]
                                                        [courtIndex] =
                                                    !_selectedCells[rowIndex]
                                                        [courtIndex];
                                              });
                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(8.0),
                                              alignment: Alignment.center,
                                              color: _selectedCells[rowIndex]
                                                      [courtIndex]
                                                  ? const Color(0xFF25E44F)
                                                  : Colors.transparent,
                                              child: _selectedCells[rowIndex]
                                                      [courtIndex]
                                                  ? Center(
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            widget.activityName,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color: const Color(
                                                                  0xFF13131A),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900,
                                                              fontSize:
                                                                  screenWidth *
                                                                      0.033,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                              height:
                                                                  screenWidth *
                                                                      0.012),
                                                          Text(
                                                            hour,
                                                            style: TextStyle(
                                                              color: const Color(
                                                                  0xFF36363F),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize:
                                                                  screenWidth *
                                                                      0.03,
                                                            ),
                                                          ),
                                                          Text(
                                                            courts[courtIndex],
                                                            style: TextStyle(
                                                              color: const Color(
                                                                  0xFF36363F),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize:
                                                                  screenWidth *
                                                                      0.03,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  : Text(''),
                                            ),
                                          );
                                        }),
                                      ],
                                    );
                                  }).toList(),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.05),

                    // SELECT COURT
                    Padding(
                      padding: EdgeInsets.only(left: screenWidth * 0.07),
                      child: Text(
                        "Select Court:",
                        style: TextStyle(
                          color: const Color(0xFF2D2D34),
                          fontFamily: "Poppins",
                          fontSize: screenWidth * 0.043,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.02),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          SizedBox(width: screenWidth * 0.06),
                          Stack(
                            children: [
                              Container(
                                width: screenWidth * 0.75,
                                height: screenWidth * 0.65,
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                      image:
                                          AssetImage('assets/images/spzo.jpg'),
                                      fit: BoxFit.cover),
                                  border: Border.all(
                                    color: const Color(0xFF1DBE1A),
                                    width: 1.2,
                                  ),
                                  borderRadius: BorderRadius.circular(20.0),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Color.fromARGB(36, 73, 73, 116),
                                        blurRadius: 6,
                                        offset: Offset(0, 2),
                                        spreadRadius: 1),
                                  ],
                                ),
                              ),

                              //LAYER
                              Container(
                                  width: screenWidth * 0.75,
                                  height: screenWidth * 0.65,
                                  decoration: BoxDecoration(
                                    color: const Color(0x7010410F),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "COURT",
                                        style: TextStyle(
                                          color: const Color(0xFFFFFAFA),
                                          fontFamily: "Poppins",
                                          fontSize: screenWidth * 0.05,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Text(
                                        "1",
                                        style: TextStyle(
                                          color: const Color(0xFFFFFAFA),
                                          fontFamily: "Inter",
                                          fontSize: screenWidth * 0.2,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "CHOSEN",
                                        style: TextStyle(
                                          color: const Color(0xFFFFFAFA),
                                          fontFamily: "Poppins",
                                          fontSize: screenWidth * 0.055,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: screenHeight * 0.12),
              ],
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: screenWidth,
              height: screenHeight * 0.1,
              decoration: BoxDecoration(
                color: Color(0xFFFFFAFA),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // VIEW SUMMARY
                  CustomButton(
                    "Confirm",
                    const Color(0xFF46D243),
                    const Color(0xFFFFFAFA),
                    isEnabled: true,
                    nextPage: Summary(
                      activityName: widget.activityName,
                      userName: "Jerry Layug",
                      organizationName: widget.organizationName,
                      selectedSportName: widget.selectedSportName,
                      purpose: widget.purpose
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.03),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
