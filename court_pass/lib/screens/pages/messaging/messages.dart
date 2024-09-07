import 'package:court_pass/screens/pages/messaging/conversation.dart';
import 'package:court_pass/screens/pages/messaging/convo.dart';
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
              itemCount: 4,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.05,
                    vertical: screenHeight * 0.007,
                  ),
                  child: const Convo(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}