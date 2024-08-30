import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Messages extends StatefulWidget {
  const Messages({super.key});

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFFFFAFA),
      body: Stack(
        children: [
          Positioned(
            top: screenHeight * 0.055,
            left: screenWidth * 0.07,
            child: Text(
              "Messages",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: screenWidth * 0.072,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          Positioned(
            top: screenHeight * 0.062,
            right: screenWidth * 0.07,
            child: GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.search,
                size: screenWidth * 0.08,
              ),
            ),
          ),
          
          Positioned(
            top: screenHeight * 0.12,
            left: 0,
            right: 0,
            bottom: 0,
            child: ListView.builder(
              padding: EdgeInsets.only(
                top: 0,
                bottom: screenHeight * 0.02,
              ),
              itemCount: 10, // Replace with the actual number of messages
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.05,
                    vertical: screenHeight * 0.005,
                  ),
                  child: const Message(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Message extends StatefulWidget {
  const Message({super.key});

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        print('Container tapped!');
      },
      child: Container(
        height: screenHeight * 0.09,
        width: screenWidth * 0.9,
        child: Row(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: screenWidth * 0.15,
                height: screenWidth * 0.15,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 4,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/sz.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(width: screenWidth * 0.023),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Sports Zone",
                        style: TextStyle(
                          color: const Color(0xFF13131A),
                          fontSize: screenWidth * 0.057,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Yesterday",
                        style: TextStyle(
                          color: const Color(0xFFA9A9A9),
                          fontSize: screenWidth * 0.032,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenWidth * 0.004),
                  Expanded(
                    child: Text(
                      "Hi this is a test text to see if this goes beyond the limit of this container...",
                      style: TextStyle(
                        color: const Color(0xFF13131A),
                        fontSize: screenWidth * 0.033,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
