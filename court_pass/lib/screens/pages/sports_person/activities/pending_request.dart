import 'package:court_pass/custom%20widgets/buttons/positive_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PendingRequest extends StatefulWidget {
  const PendingRequest({super.key});

  @override
  State<PendingRequest> createState() => _PendingRequestState();
}

class _PendingRequestState extends State<PendingRequest> {
  @override
  Widget build(BuildContext context) {

    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFFFFFAFA),
      body: Stack(
        children: [
          // Background Image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              width: screenWidth,
              height: screenHeight * 0.3,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/spzo.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // Gradient Overlay
          Positioned.fill(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0x00FFFAFA),
                    Color(0x10FFFAFA),
                    Color(0xFFFFFAFA),
                  ],
                  stops: [0.0, 0.09, 0.21],
                ),
              ),
            ),
          ),

          // Fixed "Sports Zone" and "Location"
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.17),

                // FACILITY NAME
                Text(
                  "Sports Zone",
                  style: TextStyle(
                    color: const Color(0xFF13131A),
                    fontSize: screenWidth * 0.08,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // LOCATION
                Text(
                  "Cagayan de Oro City, Philippines",
                  style: TextStyle(
                    color: const Color(0xFF13131A),
                    fontSize: screenWidth * 0.035,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          // SCROLLABLE
          Positioned(
            top: screenHeight * 0.27,
            left: 0,
            right: 0,
            bottom: screenHeight * 0,
            child: SingleChildScrollView(
              child: Column(
                children: [

                  SizedBox(height: screenHeight * 0.01),

                  Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      'The request has already been sent to Sports Zone.\nKindly wait for their approval.',
                      style: TextStyle(
                        color: const Color(0xFFFF6F64),
                        fontSize: screenWidth * 0.031,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.01),

                  // Activity and Purpose
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.065),
                    child: const Divider(
                      color: Color(0xFFC8C8C8),
                      thickness: 0.6,
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.02),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.07),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Activity Info
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildInfoLabel("Activity Name", screenWidth),
                            _buildInfoText("Badminton Game", screenWidth),

                            SizedBox(height: screenHeight * 0.03),

                            _buildInfoLabel("Purpose", screenWidth),
                            _buildInfoText("Recreation", screenWidth),
                          ],
                        ),

                        SizedBox(width: screenWidth * 0.15),

                        // Customer and Organization Info
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildInfoLabel("Customer", screenWidth),
                            _buildInfoText("Paul Roxas", screenWidth),

                            SizedBox(height: screenHeight * 0.03),

                            _buildInfoLabel("Organization", screenWidth),
                            _buildInfoText("USTP", screenWidth),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.02),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.065),
                    child: const Divider(
                      color: Color(0xFFC8C8C8),
                      thickness: 0.8,
                    ),
                  ),

                  SizedBox(
                    height: screenHeight * 0.02,
                  ),

                  //SPORTS AND PRICE
                  Center(
                    child: Column(
                      children: [

                        //ICON
                        SvgPicture.asset(
                          'assets/icons/badminton.svg',
                          width: screenWidth * 0.22,
                          height: screenWidth * 0.22,
                          color: const Color(0xFFFF6F64),
                        ),

                        //SPORT NAME
                        Text(
                          'Badminton',
                          style: TextStyle(
                            color: const Color(0xFF13131A),
                            fontSize: screenWidth * 0.05,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.bold
                          ),
                        ),

                        //PRICE
                        Text(
                          'P160 per hour',
                          style: TextStyle(
                            color: const Color(0xFF939393),
                            fontSize: screenWidth * 0.031,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w200
                          ),
                        ),

                      ],
                    ),
                  ),

                  SizedBox(
                    height: screenHeight * 0.02,
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.065),
                    child: const Divider(
                      color: Color(0xFFC8C8C8),
                      thickness: 0.8,
                    ),
                  ),

                  //Schedule Label
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.065, top: screenWidth * 0.03,),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Schedule:",
                        style: TextStyle(
                          color: const Color(0xFF13131A),
                          fontSize: screenWidth * 0.043,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    )
                  ),

                  SizedBox(
                    height: screenHeight * 0.015,
                  ),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [

                      SizedBox(width: screenWidth * 0.06),

                      //DATE ICON
                      const Icon(
                        Icons.calendar_month_outlined
                      ),

                      SizedBox(
                        width: screenHeight * 0.005,
                      ),

                      //DATE
                      Text(
                        'October 2, 2024',
                        style: TextStyle(
                          fontSize: screenWidth * 0.034,
                          color: const Color(0xFF5B5B5B),
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w200
                        ),
                      ),

                      SizedBox(
                        width: screenHeight * 0.05,
                      ),

                      //TIME ICON
                      const Icon(
                        Icons.timer_outlined
                      ),

                      SizedBox(
                        width: screenHeight * 0.005,
                      ),

                      //TIME
                      Text(
                        '9:00 AM - 2:00 PM',
                        style: TextStyle(
                          fontSize: screenWidth * 0.034,
                          color: const Color(0xFF5B5B5B),
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w200
                        ),
                      ),

                    ],
                  ),

                  SizedBox(
                    height: screenHeight * 0.02,
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.065),
                    child: const Divider(
                      color: Color(0xFFC8C8C8),
                      thickness: 0.8,
                    ),
                  ),

                  SizedBox(
                    height: screenHeight * 0.025,
                  ),

                  //COURT
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        
                      },
                      child: Container(
                        height: screenWidth * 0.5,
                        width: screenWidth * 0.65,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: const Color(0xFF1DBE1A)),
                          borderRadius: BorderRadius.circular(25),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/spzo.jpg'),
                            fit: BoxFit.cover
                          )
                        ),
                        child: Stack(
                          children: [

                            //LAYER
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: const Color(0x8010410F),
                              ),
                            ),

                            Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  //COURT
                                  Text(
                                    'Court',
                                    style: TextStyle(
                                      color: const Color(0xFFFFFAFA),
                                      fontSize: screenWidth * 0.05,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w200
                                    ),
                                  ),

                                  //COURT NUMBER
                                  Text(
                                    '1',
                                    style: TextStyle(
                                      color: const Color(0xFFFFFAFA),
                                      fontSize: screenWidth * 0.14,
                                      fontFamily: "Inter",
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),

                                  //CHOSEN
                                  Text(
                                    'CHOSEN',
                                    style: TextStyle(
                                      color: const Color(0xFFFFFAFA),
                                      fontSize: screenWidth * 0.05,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.bold
                                    ),
                                  )
                                ],      
                              ),
                            )

                          ],
                        ),
                      ),
                    )
                  ),

                  SizedBox(
                    height: screenHeight * 0.025,
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.065),
                    child: const Divider(
                      color: Color(0xFFC8C8C8),
                      thickness: 0.8,
                    ),
                  ),

                  //PAYMENT LABEL
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.065, top: screenWidth * 0.03),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Payment:",
                        style: TextStyle(
                          color: const Color(0xFF13131A),
                          fontSize: screenWidth * 0.043,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    )
                  ),

                  SizedBox(
                    height: screenHeight * 0.02,
                  ),

                  //PAYMENT TABLE
                  Stack(
                    children: [

                      Center(
                        child: Container(
                          width: screenWidth * 0.88,
                          height: screenWidth * 0.075,
                          decoration: BoxDecoration(
                            color: const Color(0xFFD9D9D9),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),

                      //TABLE CONTENCTS
                      Row(
                        children: [

                          SizedBox(width: screenWidth * 0.092),

                          //SERVICES COLUMN
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              SizedBox(height: screenHeight * 0.005),

                              //LABEL
                              Text(
                                'Services',
                                style: TextStyle(
                                  color: const Color(0xFF13131A),
                                  fontSize: screenWidth * 0.035,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w400
                                ),
                              ),

                              SizedBox(height: screenHeight * 0.013),

                              //COURT
                              Text(
                                'Basketball Court 1',
                                style: TextStyle(
                                  color: const Color(0xFF5B5B5B),
                                  fontSize: screenWidth * 0.030,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w200
                                ),
                              ),

                              SizedBox(height: screenHeight * 0.004),

                              //SERVICE CHARGE
                              Text(
                                'Service Charge',
                                style: TextStyle(
                                  color: const Color(0xFF5B5B5B),
                                  fontSize: screenWidth * 0.030,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w200
                                ),
                              ),

                            ],
                          ),

                          SizedBox(width: screenWidth * 0.09),

                          //PRICES COLUMN
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [

                              SizedBox(height: screenHeight * 0.005),

                              //LABEL
                              Text(
                                'Price',
                                style: TextStyle(
                                  color: const Color(0xFF13131A),
                                  fontSize: screenWidth * 0.035,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w400
                                ),
                              ),

                              SizedBox(height: screenHeight * 0.013),

                              //COURT PRICE
                              Text(
                                'P 160',
                                style: TextStyle(
                                  color: const Color(0xFF5B5B5B),
                                  fontSize: screenWidth * 0.03,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w200
                                ),
                              ),

                              SizedBox(height: screenHeight * 0.004),

                              //SERVICE CHARGE PRICE
                              Text(
                                'P 29',
                                style: TextStyle(
                                  color: const Color(0xFF5B5B5B),
                                  fontSize: screenWidth * 0.03,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w200
                                ),
                              ),

                            ],
                          ),

                          SizedBox(width: screenWidth * 0.09),

                          //HOURS COLUMN
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [

                              SizedBox(height: screenHeight * 0.005),

                              //LABEL
                              Text(
                                'Hour',
                                style: TextStyle(
                                  color: const Color(0xFF13131A),
                                  fontSize: screenWidth * 0.035,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w400
                                ),
                              ),

                              SizedBox(height: screenHeight * 0.013),

                              //HOURS
                              Text(
                                '5',
                                style: TextStyle(
                                  color: const Color(0xFF5B5B5B),
                                  fontSize: screenWidth * 0.03,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w200
                                ),
                              ),

                              SizedBox(height: screenHeight * 0.004),

                              //SERVICE CHARGE HOUR
                              Text(
                                '',
                                style: TextStyle(
                                  color: const Color(0xFF5B5B5B),
                                  fontSize: screenWidth * 0.033,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w200
                                ),
                              ),

                            ],
                          ),

                          SizedBox(width: screenWidth * 0.09),

                          //TOTAL COLUMN
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [

                              SizedBox(height: screenHeight * 0.005),

                              //LABEL
                              Text(
                                'Total',
                                style: TextStyle(
                                  color: const Color(0xFF13131A),
                                  fontSize: screenWidth * 0.035,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w400
                                ),
                              ),

                              SizedBox(height: screenHeight * 0.016),

                              //COURT TOTAL
                              Text(
                                'P 800',
                                style: TextStyle(
                                  color: const Color(0xFF13131A),
                                  fontSize: screenWidth * 0.03,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w200
                                ),
                              ),

                              SizedBox(height: screenHeight * 0.004),

                              //SERVICE CHARGE TOTAL
                              Text(
                                'P 29',
                                style: TextStyle(
                                  color: const Color(0xFF13131A),
                                  fontSize: screenWidth * 0.03,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w200
                                ),
                              ),

                            ],
                          )
                          //END OF TABLE CONTENTS
                        ],
                      )
                    ],
                  ),

                  SizedBox(height: screenHeight * 0.02),

                   Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [

                      //TOTAL TEXT
                      Text(
                        'Total: ',
                        style: TextStyle(
                          color: const Color(0xFF13131A),
                          fontSize: screenWidth * 0.038,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500
                        ),
                      ),

                      //TOTAL PRICE
                      Text(
                        'P 829',
                        style: TextStyle(
                          color: const Color(0xFF13131A),
                          fontSize: screenWidth * 0.038,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500
                        ),
                      ),

                      SizedBox(width: screenWidth * 0.08,)

                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [

                      //PAYMENT TEXT
                      Text(
                        'Payment: ',
                        style: TextStyle(
                          color: const Color(0xFF13131A),
                          fontSize: screenWidth * 0.038,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500
                        ),
                      ),

                      //PAYMENT PRICE
                      Text(
                        'P 529',
                        style: TextStyle(
                          color: const Color(0xFF13131A),
                          fontSize: screenWidth * 0.038,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500
                        ),
                      ),

                      SizedBox(width: screenWidth * 0.08)

                    ],
                  ),

                  SizedBox(height: screenWidth * 0.03),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [

                      //AMOUNT DUE TEXT
                      Text(
                        'Amount Due: ',
                        style: TextStyle(
                          color: const Color(0xFF13131A),
                          fontSize: screenWidth * 0.042,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.bold
                        ),
                      ),

                      //TOTAL PRICE
                      Text(
                        'P 300',
                        style: TextStyle(
                          color: const Color(0xFFFF6F64),
                          fontSize: screenWidth * 0.042,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.bold
                        ),
                      ),

                      SizedBox(width: screenWidth * 0.08)

                    ],
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.065),
                    child: const Divider(
                      color: Color(0xFFC8C8C8),
                      thickness: 0.8,
                    ),
                  ),

                  //PAYMENT METHOD
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.065, top: screenWidth * 0.03),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Payment Method:",
                        style: TextStyle(
                          color: const Color(0xFF13131A),
                          fontSize: screenWidth * 0.043,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    )
                  ),

                  SizedBox(height: screenWidth * 0.04),

                  //OPTION
                  Center(
                    child: Container(
                      width: screenWidth * 0.9,
                      height: screenHeight * 0.065,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFAFA),
                        border: Border.all(color: const Color(0xFFB6B6B6), width: 0.6),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x30091621),
                            offset: Offset(0, 1),
                            blurRadius: 3,
                          ),
                        ],
                      ),
                      child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: screenWidth * 0.04),
                              child: Image.asset('assets/images/gcash.png'),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: screenWidth * 0.06),
                  
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      SizedBox(width: screenWidth * 0.06),

                      const Icon(
                        Icons.error,
                        color: Color(0xFF78E820),
                      ),

                      SizedBox(width: screenWidth * 0.01),

                      Text(
                        'Full or Down Payments are required, in case of \nconflicts, payments will be refunded.',
                        style: TextStyle(
                          color: const Color(0xFF67C020),
                          fontSize: screenWidth * 0.033,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.bold
                        ),
                      )
                    ],
                  ),

                  SizedBox(height: screenWidth * 0.02),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      SizedBox(width: screenWidth * 0.06),

                      const Icon(
                        Icons.error,
                        color: Color(0xFFEF4A4A),
                      ),

                      SizedBox(width: screenWidth * 0.01),

                      Text(
                        'In case of unattendance, payments will not \nbe refunded',
                        style: TextStyle(
                          color: const Color(0xFFD42525),
                          fontSize: screenWidth * 0.033,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.bold
                        ),
                      )
                    ],
                  ),

                  SizedBox(height: screenWidth * 0.06),

                  //END OF SCROLLABLE CONTENTS
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build label text
  Widget _buildInfoLabel(String label, double screenWidth) {
    return Text(
      label,
      style: TextStyle(
        color: const Color(0xFFA0A0A0),
        fontSize: screenWidth * 0.033,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w200,
      ),
    );
  }

  // Helper method to build info text
  Widget _buildInfoText(String info, double screenWidth) {
    return Text(
      info,
      style: TextStyle(
        color: const Color(0xFF13131A),
        fontSize: screenWidth * 0.041,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w200,
      ),
    );
  }
}
