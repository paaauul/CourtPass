import 'package:court_pass/screens/pages/court_pass/ticket.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PastCourtPass extends StatefulWidget {
  const PastCourtPass({super.key});

  @override
  State<PastCourtPass> createState() => _PastCourtPassState();
}

class _PastCourtPassState extends State<PastCourtPass> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
              Container(
              width: screenWidth,
              height: screenHeight,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [ Color(0xFFFF4D82), Color(0xFFFF6F64)],
                  stops: [0, 0.17]
                ),
              ),
            ),
          
          SingleChildScrollView(
            child: SizedBox(
              child: Column(
                children: [

                  //BACK BUTTON
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.03, top: screenHeight * 0.05),
                      child: Align(
                      alignment: Alignment.topLeft,
                        child: GestureDetector(
                        onTap: (){
                        Navigator.pop(context);
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle
                          ),
                          width: screenWidth * 0.1, height: screenWidth * 0.1,
                          child: Icon(
                            Icons.arrow_back,
                            color: const Color(0xFFFFFAFA),
                            size: screenWidth * 0.08,
                          ),
                        )
                      ),
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.03),

                  //LOGO
                  SvgPicture.asset(
                    'assets/icons/court_pass_white.svg',
                    width: screenWidth * 0.105,
                    height: screenWidth * 0.105,
                  ),

                  SizedBox(height: screenHeight * 0.034),

                  Ticket()

                  //END OF CONTENTS
                ],
              ),
            ),
          )

          //END OF STACK
        ],
      )
    );
  }
}
