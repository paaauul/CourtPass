import 'package:flutter/material.dart';

class ReviewPreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {},
      child: Stack(
        children: [
          Container(
            width: screenWidth * 0.5,
            height: screenWidth * 0.36,
            decoration: BoxDecoration(
              color: const Color(0xFFFFFAFA),
              border: Border.all(width: 0.2, color: const Color(0xFFD3D3D3)),
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, 2),
                  blurRadius: 5,
                  color: Color(0x2013131A),
                  spreadRadius: 1,
                ),
              ],
            ),
          ),
          Positioned(
            top: screenWidth * 0.03,
            left: screenWidth * 0.03,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Profile Picture
                    Container(
                      width: screenWidth * 0.082,
                      height: screenWidth * 0.082,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            width: 0.2, color: const Color(0x6013131A)),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(0, 3),
                            blurRadius: 5,
                            color: Color(0x3013131A),
                            spreadRadius: 1,
                          ),
                        ],
                        image: const DecorationImage(
                          image: AssetImage('assets/images/spzo.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    SizedBox(width: screenWidth * 0.02),

                    // Name and Rating
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Name
                        Padding(
                          padding: EdgeInsets.only(left: screenWidth * 0.007),
                          child: Text(
                            'Paul Roxas',
                            style: TextStyle(
                              color: const Color(0xFF13131A),
                              fontFamily: "Poppins",
                              fontSize: screenWidth * 0.034,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        // Rating
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: screenWidth * 0.04,
                            ),
                            Icon(
                              Icons.star,
                              size: screenWidth * 0.04,
                            ),
                            Icon(
                              Icons.star,
                              size: screenWidth * 0.04,
                            ),
                            Icon(
                              Icons.star,
                              size: screenWidth * 0.04,
                            ),
                            Icon(
                              Icons.star,
                              size: screenWidth * 0.04,
                            ),
                            SizedBox(width: screenWidth * 0.006),
                            Text(
                              '5.0',
                              style: TextStyle(
                                color: const Color(0xFF5B5B5B),
                                fontFamily: "Poppins",
                                fontSize: screenWidth * 0.028,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: screenWidth * 0.03),

                // Review
                Padding(
                  padding:
                      EdgeInsets.only(left: screenWidth * 0.016),
                  child: Container(
                    width:
                        screenWidth * 0.4, // Ensure the width matches the card
                    child: Text(
                      'The Basketball Facility of USTP is very good! Napaka sarap laruan, parang NBA lang!',
                      style: TextStyle(
                        color: const Color(0xFF5B5B5B),
                        fontFamily: "Poppins",
                        fontSize: screenWidth * 0.03,
                        fontWeight: FontWeight.w400,
                      ),
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
