import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Conversation extends StatefulWidget{
  const Conversation({super.key});

  @override
  State<Conversation> createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> {
  @override
  Widget build(BuildContext context){

    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFFFFFAFA),
      body: Stack(
        children: [

          //TOP BAR
          Positioned(
            top: 0, left: 0, right: 0,
            child: Container(
              width: screenWidth,
              height: screenHeight * 0.115,
              decoration: const BoxDecoration(
                color: Color(0xFFFFFAFA),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x40616161),
                    offset: Offset(0,2),
                    blurRadius: 18,
                    spreadRadius: 1
                  )
                ]
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  //BACK BUTTON
                  Container(
                    padding: EdgeInsets.only(left: screenWidth * 0.04, top: screenWidth * 0.08),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        size: screenWidth * 0.07,
                        color: const Color(0xFF13131A),
                      ),
                    )
                  ),

                  SizedBox(width: screenWidth * 0.02),

                  //PHOTO
                   Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.only(left: screenWidth * 0.02, top: screenHeight * 0.034),
                      width: screenWidth * 0.11,
                      height: screenWidth * 0.11,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage("assets/images/sz.jpeg"),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x50616161),
                            offset: Offset(0,3),
                            blurRadius: 4,
                          )
                        ]
                      ),
                    ),
                  ),

                  SizedBox(width: screenWidth * 0.026),

                  //TEXT
                  Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        //FACILITY NAME
                        GestureDetector(
                          onTap: () {
                            
                          },
                          child: Text(
                            "Sports Zone",
                            style: TextStyle(
                              color: const Color(0xFF13131A),
                              fontFamily: "Poppins",
                              fontSize: screenWidth * 0.045,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),

                        Text(
                          "Cagayan de Oro City, Philippines",
                          style: TextStyle(
                            color: const Color(0xFF43434A),
                            fontFamily: "Poppins",
                            fontSize: screenWidth * 0.030,
                          ),
                        )
                      ],
                    ),
                  ),

                  SizedBox(width: screenWidth * 0.086),

                  Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.038),
                    child: GestureDetector(
                      onTap: () {
                      
                      },
                      child: Icon(
                        Icons.call,
                        color: const Color(0xFF292929),
                        size: screenWidth * 0.065,
                      ),
                    ),
                  )

                  //END OF TOP BAR
                ],
              )
            ),
          ),

          Positioned(
            bottom: screenHeight * 0.02, left: screenWidth * 0.030, right: 0,
            child: Row(
              children: [

                //ADD BUTTON
                GestureDetector(
                  onTap: () {
                    
                  },
                  child: Container(
                    width: screenWidth * 0.118,
                    height: screenWidth * 0.118,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFF13131A),
                        width: 0.6,
                      ),
                      color: const Color(0xFFFFFAFA),
                      shape: BoxShape.circle,
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x60616161),
                          offset: Offset(0,4),
                          blurRadius: 5,
                          spreadRadius: 2
                        )
                      ]
                    ),
                    child: Icon(
                      Icons.add,
                      size: screenWidth * 0.08,
                    ),
                  ),
                ),

                SizedBox(width: screenWidth * 0.02),
                
                //TEXT FIELD
                Container(
                  width: screenWidth * 0.67,
                  height: screenWidth * 0.12,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: const Color(0xFF13131A),
                      width: 0.8
                    ),
                    color: const Color(0xFFFFFAFA),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x50616161),
                        offset: Offset(0,4),
                        blurRadius: 4,
                        spreadRadius: 1
                      )
                    ]
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TextField(
                      style: const TextStyle(color: Color(0xFF13131A)),
                      decoration: InputDecoration(
                        hintText: 'Message',
                        hintStyle: TextStyle(
                          color: const Color(0xFF13131A),
                          fontFamily: "Inter",
                          fontSize: screenWidth * 0.039,
                          fontWeight: FontWeight.w300
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 17),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),

                SizedBox(width: screenWidth * 0.02),

                //SEND BUTTON
                GestureDetector(
                  onTap: () {
                    
                  },
                  child: Container(
                    width: screenWidth * 0.118,
                    height: screenWidth * 0.118,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFF13131A),
                        width: 0.6
                      ),
                      color: const Color(0xFFFFFAFA),
                      shape: BoxShape.circle,
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x50616161),
                          offset: Offset(0,4),
                          blurRadius: 5,
                          spreadRadius: 2
                        )
                      ]
                    ),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.020, vertical: screenWidth * 0.018),
                        child: SvgPicture.asset(
                        'assets/icons/send.svg',
                        color: const Color(0xFF424141),
                        width: screenWidth * 0.07,
                        height: screenWidth * 0.07,
                      ),)
                    )
                  ),
                )

                //END OF BOTTOM WIDGETS
              ],
            ),
          ),

          //END
        ],
      ),
    );
  }
}