import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SportPreview extends StatelessWidget{
  
  late String sportIcon;
  late String sportName;
  late String price;

  SportPreview(this.sportIcon, this.sportName, this.price);

  @override
  Widget build(BuildContext context){

    var screenWidth = MediaQuery.of(context).size.width;

    return Row(
      children: [

        SvgPicture.asset(
          sportIcon,
          color: const Color(0xFFFF6F64),
          width: screenWidth * 0.13,
        ),

        SizedBox(width: screenWidth * 0.01),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              sportName,
              style: TextStyle(
                color: const Color(0xFF5B5B5B),
                fontSize: screenWidth * 0.044,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w400
              ),
            ),
            
            Text(
              'P$price per hour',
              style: TextStyle(
                color: const Color(0xFF868686),
                fontSize: screenWidth * 0.03,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w200
              ),
            ),
          ],
        )
          
      ],
    );
  }
}