import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:court_pass/classes/sport.dart';
import 'package:court_pass/classes/sports.dart';
import 'package:court_pass/custom%20widgets/buttons/custom_button.dart';
import 'package:court_pass/custom%20widgets/buttons/positive_button.dart';
import 'package:court_pass/database%20services/facility_database_service.dart';
import 'package:court_pass/screens/pages/sports_person/home/review_preview.dart';
import 'package:court_pass/screens/pages/sports_person/home/sport_preview.dart';
import 'package:court_pass/screens/pages/sports_person/requesting/request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoding/geocoding.dart';

class FacilityDetails extends StatefulWidget {
  final String documentId;
  final String facilityName;

  const FacilityDetails({
    Key? key,
    required this.documentId,
    required this.facilityName,
  }) : super(key: key);

  @override
  State<FacilityDetails> createState() => _FacilityDetailsState();
}

class _FacilityDetailsState extends State<FacilityDetails> {
  double _averageRating = 0.0;
  int _numberOfRatings = 0;
  String? _mainImageURL;
  String _openingTime = '';
  String _closingTime = '';
  String? _about;

  @override
  void initState() {
    super.initState();
    _getAverageRating();
    _getImageURL();
    _getOpeningTime();
    _getClosingTime();
    _getAbout();
  }

  Future<void> _getImageURL() async {
    String? imageUrl =
        await FacilityDatabaseService().getImageURL(widget.documentId);

    setState(() {
      _mainImageURL = imageUrl;
    });
  }

  Future<void> _getAbout() async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('facilities')
          .doc(widget.documentId)
          .get();

      if (documentSnapshot.exists) {
        setState(() {
          _about = documentSnapshot['about'] as String?;
        });
      } else {
        print('Document not found');
      }
    } catch (e) {
      print('Error fetching image URL: $e');
    }
  }

  Future<void> _getAverageRating() async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('facilities')
          .doc(widget.documentId)
          .collection('facilityRatings')
          .get();

      if (snapshot.docs.isEmpty) {
        setState(() {
          _averageRating = 0.0;
        });
        return;
      }

      double totalRating = 0.0;
      for (var doc in snapshot.docs) {
        totalRating += doc['rating'];
      }

      double avgRating = totalRating / snapshot.docs.length;

      setState(() {
        _averageRating = avgRating;
        _numberOfRatings = snapshot.docs.length;
      });
    } catch (e) {
      print('Error fetching ratings: $e');
    }
  }

  Widget _buildStarRating(double rating, double screenWidth) {
    int fullStars = rating.floor();
    bool hasHalfStar = (rating - fullStars) >= 0.5;
    int totalStars = 5;

    return Row(
      children: List.generate(totalStars, (index) {
        IconData iconData;
        if (index < fullStars) {
          iconData = Icons.star;
        } else if (index == fullStars && hasHalfStar) {
          iconData = Icons.star_half;
        } else {
          iconData = Icons.star_border;
        }

        return ShaderMask(
          shaderCallback: (Rect bounds) {
            return const LinearGradient(
              colors: [Color(0xFFFF4D82), Color(0xFFE58577)],
              stops: [0.18, 0.6],
            ).createShader(bounds);
          },
          blendMode: BlendMode.srcIn,
          child: Icon(
            iconData,
            color: const Color(0xFFFF6F64),
            size: screenWidth * 0.05,
          ),
        );
      }),
    );
  }

  Future<void> _getOpeningTime() async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('facilities')
          .doc(widget.documentId)
          .get();

      if (documentSnapshot.exists) {
        setState(() {
          _openingTime = documentSnapshot.get('openingTime');
        });
      } else {
        throw 'Document does not exist';
      }
    } catch (e) {
      print('Error fetching opening time: $e');
    }
  }

  Future<void> _getClosingTime() async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('facilities')
          .doc(widget.documentId)
          .get();

      if (documentSnapshot.exists) {
        setState(() {
          _closingTime = documentSnapshot.get('closingTime') as String;
        });
      } else {
        throw 'Document does not exist';
      }
    } catch (e) {
      print('Error fetching closing time: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFFFFAFA),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: screenHeight * 0.1,
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Column(
                    children: [
                      //PHOTO
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: screenWidth,
                          height: screenHeight * 0.3,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: _mainImageURL != null
                                      ? NetworkImage(_mainImageURL!)
                                      : const AssetImage('assets/images/q.jpeg')
                                          as ImageProvider,
                                  fit: BoxFit.cover)),
                        ),
                      ),

                      SizedBox(height: screenHeight * 0.016),

                      //FACILITY NAME
                      Align(
                          alignment: Alignment.topLeft,
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(left: screenWidth * 0.06),
                                child: Text(
                                  widget.facilityName,
                                  style: TextStyle(
                                      color: const Color(0xFF13131A),
                                      fontSize: screenWidth * 0.06,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                            ],
                          )),

                      //TYPE OF FACILITY
                      Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: screenWidth * 0.06),
                            child: FutureBuilder(
                                future: FacilityDatabaseService()
                                    .getFacilityType(widget.documentId),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return Text(
                                      snapshot.data ??
                                          'Loading Facility Type...',
                                      style: TextStyle(
                                        color: const Color(0xFF5B5B5B),
                                        fontSize: screenWidth * 0.032,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w400,
                                      ),
                                    );
                                  } else if (snapshot.hasError) {
                                    return Text(
                                      snapshot.data ??
                                          'Error fetching Facility Type',
                                      style: TextStyle(
                                        color: const Color(0xFF5B5B5B),
                                        fontSize: screenWidth * 0.032,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w400,
                                      ),
                                    );
                                  } else {
                                    return Text(
                                      snapshot.data ??
                                          'Sports Offered unavailable',
                                      style: TextStyle(
                                        color: const Color(0xFF5B5B5B),
                                        fontSize: screenWidth * 0.033,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w400,
                                      ),
                                    );
                                  }
                                }),
                          )),

                      SizedBox(height: screenHeight * 0.012),

                      //RATING
                      Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                              padding:
                                  EdgeInsets.only(left: screenWidth * 0.054),
                              child: Row(
                                children: [
                                  //RATING

                                  _buildStarRating(_averageRating, screenWidth),
                                  SizedBox(width: screenWidth * 0.012),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: screenWidth * 0.007),
                                    child: Text(
                                      _averageRating.toString(),
                                      style: TextStyle(
                                          color: const Color(0xFF797979),
                                          fontSize: screenWidth * 0.03,
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),

                                  //REVIEW
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: screenWidth * 0.007),
                                    child: Text(
                                      ' (${_numberOfRatings.toString()} Reviews)',
                                      style: TextStyle(
                                          color: const Color(0xFFAFAFAF),
                                          fontSize: screenWidth * 0.03,
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.w200),
                                    ),
                                  ),
                                ],
                              ))),

                      SizedBox(height: screenHeight * 0.018),

                      //TIME
                      Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                              padding:
                                  EdgeInsets.only(left: screenWidth * 0.05),
                              child: Row(
                                children: [
                                  //LOGO
                                  Icon(Icons.av_timer_outlined,
                                      color: const Color(0xFF7B7B7B),
                                      size: screenWidth * 0.06),

                                  //TIME
                                  Text(
                                    _openingTime.isNotEmpty &&
                                            _closingTime.isNotEmpty
                                        ? '$_openingTime - $_closingTime'
                                        : 'Loading...',
                                    style: TextStyle(
                                        color: const Color(0xFF838383),
                                        fontSize: screenWidth * 0.032,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w200),
                                  ),
                                ],
                              ))),

                      SizedBox(height: screenHeight * 0.002),

                      //DATE
                      Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                              padding:
                                  EdgeInsets.only(left: screenWidth * 0.05),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  //LOGO
                                  Icon(Icons.calendar_month_outlined,
                                      color: const Color(0xFF7B7B7B),
                                      size: screenWidth * 0.058),

                                  //DATE
                                  Text(
                                    ' Open Monday to Saturday',
                                    style: TextStyle(
                                        color: const Color(0xFF838383),
                                        fontSize: screenWidth * 0.032,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w200),
                                  ),
                                ],
                              ))),

                      SizedBox(height: screenHeight * 0.005),

                      //LOCATION
                      Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                              padding:
                                  EdgeInsets.only(left: screenWidth * 0.05),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  //LOGO
                                  Icon(Icons.location_on,
                                      color: const Color(0xFF9D9D9D),
                                      size: screenWidth * 0.06),

                                  //LOCATION
                                  Padding(
                                    padding: EdgeInsets.only(left: screenWidth * 0.006),
                                    child: FutureBuilder(
                                        future: FacilityDatabaseService()
                                            .getGeoLocationAsString(
                                                widget.documentId),
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState ==
                                              ConnectionState.waiting) {
                                            return Text(
                                              snapshot.data ??
                                                  'Loading Location...',
                                              style: TextStyle(
                                                color: const Color(0xFF838383),
                                                fontSize: screenWidth * 0.032,
                                                fontFamily: "Poppins",
                                                fontWeight: FontWeight.w400,
                                              ),
                                            );
                                          } else if (snapshot.hasError) {
                                            return Text(
                                              snapshot.data ??
                                                  'Error fetching location',
                                              style: TextStyle(
                                                color: const Color(0xFF838383),
                                                fontSize: screenWidth * 0.032,
                                                fontFamily: "Poppins",
                                                fontWeight: FontWeight.w400,
                                              ),
                                            );
                                          } else {
                                            return Text(
                                              snapshot.data ??
                                                  'Location unavailable',
                                              style: TextStyle(
                                                color: const Color(0xFF838383),
                                                fontSize: screenWidth * 0.032,
                                                fontFamily: "Poppins",
                                                fontWeight: FontWeight.w400,
                                              ),
                                            );
                                          }
                                        }),
                                  ),
                                ],
                              ))),

                      SizedBox(height: screenHeight * 0.02),

                      //MAPS
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: screenWidth * 0.9,
                          height: screenHeight * 0.22,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      const AssetImage('assets/images/map.png'),
                                  fit: BoxFit.cover),
                              border: Border.all(
                                  width: 0.05, color: const Color(0xFF13131A)),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromARGB(64, 112, 112, 114),
                                  offset: Offset(0, 1),
                                  blurRadius: 2,
                                )
                              ]),
                        ),
                      ),

                      SizedBox(height: screenHeight * 0.03),

                      //ABOUT LABEL
                      Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: screenWidth * 0.06),
                            child: Text(
                              "About",
                              style: TextStyle(
                                  color: const Color(0xFF13131A),
                                  fontSize: screenWidth * 0.046,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w800),
                            ),
                          )),

                      SizedBox(height: screenHeight * 0.01),

                      //ABOUT
                      Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: screenWidth * 0.06,
                                right: screenWidth * 0.06),
                            child: Text(
                              _about != null
                                  ? _about!
                                  : 'No information available',
                              style: TextStyle(
                                  color: const Color(0xFF5B5B5B),
                                  fontSize: screenWidth * 0.032,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w400),
                            ),
                          )),

                      SizedBox(height: screenHeight * 0.03),

                      //DETAILS AND RULES LABEL
                      Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: screenWidth * 0.06),
                            child: Text(
                              'Details and Rules',
                              style: TextStyle(
                                  color: const Color(0xFF13131A),
                                  fontSize: screenWidth * 0.046,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w800),
                            ),
                          )),

                      SizedBox(height: screenHeight * 0.013),

                      //APPROVAL
                      Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                              padding:
                                  EdgeInsets.only(left: screenWidth * 0.05),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  //LOGO
                                  Icon(Icons.approval,
                                      color: const Color(0xFF9D9D9D),
                                      size: screenWidth * 0.06),

                                  //APPROVAL
                                  Text(
                                    ' Reservation requires facility approval',
                                    style: TextStyle(
                                        color: const Color(0xFF5B5B5B),
                                        fontSize: screenWidth * 0.032,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w200),
                                  ),
                                ],
                              ))),

                      SizedBox(height: screenHeight * 0.005),

                      //DOWN PAYMENT
                      Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                              padding:
                                  EdgeInsets.only(left: screenWidth * 0.05),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  //LOGO
                                  Icon(Icons.money,
                                      color: const Color(0xFF9D9D9D),
                                      size: screenWidth * 0.058),

                                  //DOWN PAYMENT
                                  Text(
                                    ' Requires full or initial payment',
                                    style: TextStyle(
                                        color: const Color(0xFF5B5B5B),
                                        fontSize: screenWidth * 0.032,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w200),
                                  ),
                                ],
                              ))),

                      SizedBox(height: screenHeight * 0.005),

                      //TIME
                      Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                              padding:
                                  EdgeInsets.only(left: screenWidth * 0.05),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  //LOGO
                                  Icon(Icons.timer_outlined,
                                      color: const Color(0xFF9D9D9D),
                                      size: screenWidth * 0.058),

                                  //TIME
                                  Text(
                                    ' Strictly no exceeding of time limit',
                                    style: TextStyle(
                                        color: const Color(0xFF5B5B5B),
                                        fontSize: screenWidth * 0.032,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w200),
                                  ),
                                ],
                              ))),

                      SizedBox(height: screenHeight * 0.03),

                      //SPORTS LABEL
                      Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: screenWidth * 0.06),
                            child: Text(
                              'Sports',
                              style: TextStyle(
                                  color: const Color(0xFF13131A),
                                  fontSize: screenWidth * 0.046,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w800),
                            ),
                          )),

                      SizedBox(height: screenHeight * 0.03),

                      //SPORTS 1
                      Padding(
                        padding: EdgeInsets.only(left: screenWidth * 0.06),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SportPreview(Sports().getSportIcon("Basketball"),
                                Sports().getSportName("Basketball"), "160"),
                          ],
                        ),
                      ),

                      SizedBox(height: screenHeight * 0.03),

                      //REVIEWS LABEL
                      Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: screenWidth * 0.06),
                            child: Text(
                              'Ratings and Reviews',
                              style: TextStyle(
                                  color: const Color(0xFF13131A),
                                  fontSize: screenWidth * 0.046,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w800),
                            ),
                          )),

                      SizedBox(height: screenHeight * 0.02),

                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: screenWidth * 0.06),
                            child: StreamBuilder<Object>(
                                stream: null,
                                builder: (context, snapshot) {
                                  return ReviewPreview();
                                }),
                          ),
                        ],
                      ),

                      SizedBox(height: screenHeight * 0.02),

                      //END OF COLUMN
                    ],
                  ),

                  //BACK BUTTON
                  Positioned(
                    top: screenWidth * 0.14,
                    left: screenWidth * 0.052,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFFFFAFA),
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0x3013131A),
                                    offset: Offset(0, 2),
                                    blurRadius: 4,
                                    spreadRadius: 1)
                              ]),
                          width: screenWidth * 0.083,
                          height: screenWidth * 0.083,
                          child: Icon(
                            Icons.arrow_back,
                            color: const Color(0xFF13131A),
                            size: screenWidth * 0.06,
                          ),
                        )),
                  ),

                  //MESSAGE
                  Positioned(
                      top: screenWidth * 0.58,
                      right: screenWidth * 0.05,
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                            width: screenWidth * 0.12,
                            height: screenWidth * 0.12,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color(0xFF13131A), width: 0.6),
                                color: const Color(0xFFFFFAFA),
                                shape: BoxShape.circle,
                                boxShadow: const [
                                  BoxShadow(
                                      color: Color(0x50616161),
                                      offset: Offset(0, 1),
                                      blurRadius: 5,
                                      spreadRadius: 2)
                                ]),
                            child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: screenWidth * 0.017,
                                      vertical: screenWidth * 0.018),
                                  child: SvgPicture.asset(
                                    'assets/icons/send.svg',
                                    color: const Color(0xFF424141),
                                    width: screenWidth * 0.075,
                                    height: screenWidth * 0.075,
                                  ),
                                ))),
                      )),
                ],
              ),
            ),
          ),

          // BOTTOM SECTION
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: screenWidth,
              height: screenHeight * 0.095,
              decoration: const BoxDecoration(
                color: Color(0xFFFFFAFA),
              ),
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.013),

                  // REQUEST BUTTON
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Request()),
                        );
                      },
                      child: PositiveButton("Request Reservation")),
                ],
              ),
            ),
          ),

          //END OF STACK
        ],
      ),
    );
  }
}
