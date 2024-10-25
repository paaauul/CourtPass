import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:court_pass/database%20services/facility_database_service.dart';
import 'package:court_pass/screens/pages/sports_person/home/facility_details.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

class FacilityHomePreview extends StatefulWidget {
  String documentId;
  String name;
  final VoidCallback onTap;

  FacilityHomePreview(
      {super.key,
      required this.documentId,
      required this.onTap,
      required this.name});

  @override
  State<FacilityHomePreview> createState() => _FacilityHomePreviewState();
}

class _FacilityHomePreviewState extends State<FacilityHomePreview> {
  FacilityDatabaseService facilityDatabaseService = FacilityDatabaseService();

  double _averageRating = 0.0;
  String? _mainImageURL;

  @override
  void initState() {
    super.initState();
    _getAverageRating();
    _getImageURL();
  }

  Future<void> _getImageURL() async {
    String? imageUrl =
        await FacilityDatabaseService().getImageURL(widget.documentId);

    setState(() {
      _mainImageURL = imageUrl;
    });
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
        if (index < fullStars) {
          return Icon(Icons.star,
              color: const Color(0xFFFF6F64), size: screenWidth * 0.055);
        } else if (index == fullStars && hasHalfStar) {
          return Icon(Icons.star_half,
              color: const Color(0xFFFF6F64), size: screenWidth * 0.055);
        } else {
          return Icon(Icons.star_border,
              color: const Color(0xFFD9D9D9), size: screenWidth * 0.055);
        }
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: widget.onTap,
      child: Stack(
        children: [
          //CONTAINER
          Container(
            width: screenWidth * 0.86,
            height: screenWidth * 0.847,
            decoration: BoxDecoration(
                color: const Color(0xFFFFFAFA),
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: const [
                  BoxShadow(
                      color: Color(0x25313640),
                      offset: Offset(0, 0),
                      blurRadius: 12,
                      spreadRadius: 1)
                ]),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //IMAGE
              Container(
                width: screenWidth * 0.86,
                height: screenWidth * 0.5,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    image: DecorationImage(
                        image: _mainImageURL != null
                            ? NetworkImage(_mainImageURL!)
                            : const AssetImage('assets/images/q.jpeg')
                                as ImageProvider,
                        fit: BoxFit.cover)),
              ),

              //FACILITY NAME
              Padding(
                padding: EdgeInsets.only(
                    left: screenWidth * 0.04, top: screenWidth * 0.025),
                child: FittedBox(
                  child: Text(
                    widget.name,
                    style: TextStyle(
                        color: const Color(0xFF13131A),
                        fontSize: screenWidth * 0.054,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w800),
                  ),
                ),
              ),

              //LOCATION
              Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.04),
                  child: FittedBox(
                    child: FutureBuilder(
                        future: FacilityDatabaseService()
                            .getGeoLocationAsString(widget.documentId),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Text(
                              snapshot.data ?? 'Loading Location...',
                              style: TextStyle(
                                color: const Color(0xFF5B5B5B),
                                fontSize: screenWidth * 0.032,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w400,
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return Text(
                              snapshot.data ?? 'Error fetching location',
                              style: TextStyle(
                                color: const Color(0xFF5B5B5B),
                                fontSize: screenWidth * 0.032,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w400,
                              ),
                            );
                          } else {
                            return Text(
                              snapshot.data ?? 'Location unavailable',
                              style: TextStyle(
                                color: const Color(0xFF5B5B5B),
                                fontSize: screenWidth * 0.032,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w400,
                              ),
                            );
                          }
                        }),
                  )),

              SizedBox(height: screenHeight * 0.016),

              // SPORTS OFFERED
              Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.04),
                child: FutureBuilder<List<Widget>>(
                  future: FacilityDatabaseService()
                      .getOfferedSports(widget.documentId, screenWidth),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text(
                        'Loading Sports...',
                        style: TextStyle(
                          color: const Color(0xFF5B5B5B),
                          fontSize: screenWidth * 0.032,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400,
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Text(
                        'Error fetching sports',
                        style: TextStyle(
                          color: const Color(0xFF5B5B5B),
                          fontSize: screenWidth * 0.032,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400,
                        ),
                      );
                    } else {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: snapshot.data!,
                      );
                    }
                  },
                ),
              ),

              SizedBox(height: screenHeight * 0.01),

              Container(
                width: screenWidth * 0.86,
                height: screenWidth * 0.0015,
                color: const Color(0xFFB3B3B3),
              ),

              SizedBox(height: screenHeight * 0.0085),

              SizedBox(
                width: screenWidth * 0.87,
                height: screenHeight * 0.027,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth * 0.04, right: screenWidth * 0.04),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //PRICE
                      FutureBuilder<Widget>(
                        future: FacilityDatabaseService()
                            .getOfferedSportsPriceRange(widget.documentId,
                                MediaQuery.of(context).size.width),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Text(
                              'Loading Price...',
                              style: TextStyle(
                                color: const Color(0xFF5B5B5B),
                                fontSize: screenWidth * 0.032,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w400,
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            return snapshot.data ?? Text('No data available');
                          }
                        },
                      ),

                      Spacer(),

                      //RATING
                      Padding(
                        padding: EdgeInsets.only(bottom: screenWidth * 0.01),
                        child: Row(
                          children: [
                            _buildStarRating(_averageRating, screenWidth),
                            SizedBox(width: screenWidth * 0.012),
                            Padding(
                              padding:
                                  EdgeInsets.only(top: screenWidth * 0.007),
                              child: Text(
                                _averageRating.toString(),
                                style: TextStyle(
                                    color: const Color(0xFF797979),
                                    fontSize: screenWidth * 0.035,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )

              //END OF PREVIEW
            ],
          )
        ],
      ),
    );
  }
}
