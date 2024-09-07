import 'package:court_pass/screens/pages/messaging/conversation.dart';
import 'package:flutter/material.dart';

class Convo extends StatefulWidget {
  const Convo({super.key});

  @override
  State<Convo> createState() => _ConvoState();
}

class _ConvoState extends State<Convo> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const Conversation()));
      },
      child: SizedBox(
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
