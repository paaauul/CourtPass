import 'dart:async';
import 'package:flutter/material.dart';

class Ticket extends StatefulWidget {
  const Ticket({super.key});

  @override
  State<Ticket> createState() => _TicketState();
}

class _TicketState extends State<Ticket> {
  Duration timeLeft = const Duration(hours: 2, minutes: 00); // Example with hours and minutes
  late Timer timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (timeLeft.inSeconds > 0) {
        setState(() {
          timeLeft = timeLeft - const Duration(seconds: 1);
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  // Function to format the time string based on hours, minutes, and seconds
  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String hours = duration.inHours > 0 ? "${twoDigits(duration.inHours)} hours : " : "";
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    
    return "$hours$minutes minutes : $seconds seconds";
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Container(
            width: screenWidth * 0.83,
            height: screenHeight * 1.2,
            decoration: const BoxDecoration(
                color: Color(0xFFFFFAFA),
                borderRadius: BorderRadius.all(Radius.circular(9)),
                boxShadow: [
                  BoxShadow(
                      color: Color(0x4026296A),
                      offset: Offset(0, 6),
                      blurRadius: 7,
                      spreadRadius: 3)
                ]),

            // CONTENTS
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: screenHeight * 0.1),

                // ACTIVITY NAME
                Text(
                  "Badminton Game",
                  style: TextStyle(
                      color: const Color(0xFF13131A),
                      fontSize: screenWidth * 0.06,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold),
                ),

                // PARTICIPANT NAME
                Text(
                  "Paul Roxas",
                  style: TextStyle(
                      color: const Color(0xFF7B7C81),
                      fontSize: screenWidth * 0.045,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500),
                ),

                SizedBox(height: screenHeight * 0.015),

                // LINE
                Divider(
                  color: const Color(0xFFC2C2C2),
                  indent: screenWidth * 0.08,
                  endIndent: screenWidth * 0.08,
                  thickness: 1.2,
                ),

                SizedBox(height: screenHeight * 0.012),

                // FACILITY NAME
                Text(
                  "Alwana Business Park",
                  style: TextStyle(
                      color: const Color(0xFF13131A),
                      fontSize: screenWidth * 0.043,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500),
                ),

                // SPORT AND COURT
                Text(
                  "Basketball Court 1",
                  style: TextStyle(
                      color: const Color(0xFF5B5B5B),
                      fontSize: screenWidth * 0.038,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w200),
                ),

                SizedBox(height: screenHeight * 0.025),

                // DATE
                Text(
                  "JUNE 1, 2024",
                  style: TextStyle(
                      color: const Color(0xFF13131A),
                      fontSize: screenWidth * 0.058,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold),
                ),

                // TIME
                Text(
                  "9:00 AM - 10:00 AM",
                  style: TextStyle(
                      color: const Color(0xFF5B5B5B),
                      fontSize: screenWidth * 0.042,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w200),
                ),

                SizedBox(height: screenHeight * 0.02),

                // TIME LEFT
                Text(
                  "Time Left:",
                  style: TextStyle(
                      color: const Color(0xFF5B5B5B),
                      fontSize: screenWidth * 0.038,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w200),
                ),

                // TIMER
                Text(
                  formatTime(timeLeft),
                  style: TextStyle(
                      color: const Color(0xFFFF6F64),
                      fontSize: screenWidth * 0.0365,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w200),
                ),

                SizedBox(height: screenHeight * 0.013),

                // LINE
                Divider(
                  color: const Color(0xFFC2C2C2),
                  indent: screenWidth * 0.08,
                  endIndent: screenWidth * 0.08,
                  thickness: 1.2,
                ),

                // END OF CONTENTS
              ],
            ))
      ],
    );
  }
}
