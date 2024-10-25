import 'package:court_pass/screens/pages/facility/bookings/previews/pending_preview.dart';
import 'package:flutter/material.dart';

class PendingBookings extends StatelessWidget {
  const PendingBookings({super.key});

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
              return const Padding(
                padding: EdgeInsets.only(bottom: 12.0),
                child: PendingPreview(),
              );
            }),
          ),
        ),
      ),
    );
  }
}
