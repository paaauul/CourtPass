import 'package:flutter/material.dart';

class Schedules extends StatefulWidget {
  const Schedules({super.key});

  @override
  State<Schedules> createState() => _SchedulesState();
}

class _SchedulesState extends State<Schedules> {
  final int numberOfCourts = 5; // Example number of courts
  final List<String> hours = List.generate(12, (index) {
    final hour = index + 8; // Example starting hour (8 AM)
    final period = hour >= 12 ? 'PM' : 'AM';
    final hourIn12 = hour > 12 ? hour - 12 : hour;
    return '$hourIn12:00 $period';
  });

  List<List<bool>> selectedCells = [];

  @override
  void initState() {
    super.initState();
    selectedCells = List.generate(
      hours.length,
      (index) => List.generate(numberOfCourts, (_) => false),
    );
  }

  void toggleCell(int hourIndex, int courtIndex) {
    setState(() {
      selectedCells[hourIndex][courtIndex] = !selectedCells[hourIndex][courtIndex];
      // Highlight the cell below if the cell is selected
      if (selectedCells[hourIndex][courtIndex]) {
        if (hourIndex < hours.length - 1) {
          selectedCells[hourIndex + 1][courtIndex] = true;
        }
      } else {
        if (hourIndex < hours.length - 1) {
          selectedCells[hourIndex + 1][courtIndex] = false;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFAFA),
      body: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Fixed column for hours
            Container(
              width: 100, // Fixed width for the hours column
              child: Column(
                children: [
                  Container(
                    color: Colors.grey[300], // Header background color
                    height: 56,
                    alignment: Alignment.center,
                    child: Text(
                      'TIME',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  ...hours.map((hour) => Container(
                        color: Colors.grey[200],
                        height: 56, // Match the height of cells in the scrollable table
                        alignment: Alignment.center,
                        child: Text(
                          hour,
                          style: TextStyle(color: Colors.black),
                        ),
                      ))
                ],
              ),
            ),
            // Scrollable part of the table
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: DataTable(
                    columnSpacing: 8.0,
                    headingRowHeight: 56.0,
                    dataRowHeight: 56.0,
                    columns: [
                      // Empty column for the fixed column
                      DataColumn(label: SizedBox.shrink()),
                      ...List.generate(
                        numberOfCourts,
                        (index) => DataColumn(label: Text('Court ${index + 1}')),
                      ),
                    ],
                    rows: List.generate(
                      hours.length,
                      (hourIndex) => DataRow(
                        cells: [
                          DataCell(SizedBox.shrink()), // Empty cell for the fixed column
                          ...List.generate(
                            numberOfCourts,
                            (courtIndex) => DataCell(
                              GestureDetector(
                                onTap: () => toggleCell(hourIndex, courtIndex),
                                child: Container(
                                  color: selectedCells[hourIndex][courtIndex]
                                      ? Colors.green
                                      : Colors.transparent,
                                  width: 100, // Match the width of cells in the fixed column
                                  height: 56,
                                  child: Center(
                                    child: Text(
                                      '',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
