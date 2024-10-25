import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PendingPreview extends StatelessWidget {
  const PendingPreview({super.key});

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
              SizedBox(width: screenWidth * 0.02),
              // TEXTS
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Pasingot ta Bai",
                    style: TextStyle(
                      color: const Color(0xFF13131A),
                      fontSize: screenWidth * 0.048,
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
                    "Sep 14, 2023 | 9:00 AM - 11:00 AM",
                    style: TextStyle(
                      color: const Color(0xFF585858),
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
