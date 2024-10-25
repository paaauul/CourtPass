import 'package:court_pass/screens/pages/sports_person/activities/ongoing_activity.dart';
import 'package:court_pass/screens/pages/sports_person/activities/pending_activity.dart';
import 'package:flutter/material.dart';

class Pending extends StatelessWidget {
  const Pending({super.key});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: screenHeight * 0.8,
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(10, (index) {
            return const Padding(
              padding: EdgeInsets.only(bottom: 12.0),
              child: PendingActivity(),
            );
          }),
        ),
      ),
    );
  }
}
