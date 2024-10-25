import 'package:court_pass/screens/pages/facility/bookings/pending_bookings.dart';
import 'package:court_pass/screens/pages/sports_person/activities/pending_activity.dart';
import 'package:flutter/material.dart';

class UpcomingBookings extends StatelessWidget {
  const UpcomingBookings({super.key});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: screenHeight * 0.8,
        child: SingleChildScrollView(
          child: Column(
            children: List.generate(10, (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: const PendingBookings(),
              );
            }),
          ),
        ),
      ),
    );
  }
}
