import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:async';

class OngoingActivity extends StatefulWidget {
  const OngoingActivity({super.key});

  @override
  State<OngoingActivity> createState() => _OngoingActivityState();
}

class _OngoingActivityState extends State<OngoingActivity> {
  Duration timeLeft = const Duration(hours: 2, minutes: 00);

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

    return GestureDetector(
      onTap: () {
        // Handle tap event
      },
      child: Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          width: screenWidth * 0.9,
          height: screenHeight * 0.08,
          child: Row(
            children: [
              // ICON
              SvgPicture.asset(
                'assets/icons/basketball.svg',
                height: screenWidth * 0.16,
                color: const Color(0xFF13131A),
              ),
              SizedBox(width: screenWidth * 0.01),
              // TEXTS
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Pasingot ta Bai",
                    style: TextStyle(
                      color: const Color(0xFF13131A),
                      fontSize: screenWidth * 0.046,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "Sports Zone",
                    style: TextStyle(
                      color: const Color(0xFF434343),
                      fontSize: screenWidth * 0.032,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    formatTime(timeLeft),
                    style: TextStyle(
                      color: const Color(0xFFFF6F64),
                      fontSize: screenWidth * 0.032,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
