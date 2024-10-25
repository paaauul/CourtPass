import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:court_pass/classes/facility.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

const String FACILITY_COLLECTION_REF = "facilities";

class FacilityDatabaseService {
  static final FacilityDatabaseService _instance = FacilityDatabaseService._internal();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late final CollectionReference<Facility> _facilityRef;

  // Private constructor
  FacilityDatabaseService._internal() {
    _facilityRef =
        _firestore.collection(FACILITY_COLLECTION_REF).withConverter<Facility>(
              fromFirestore: (snapshots, _) => Facility.fromJson(
                snapshots.data()!,
              ),
              toFirestore: (facility, _) => facility.toJson(),
            );
  }

  // Factory constructor to return the same instance
  factory FacilityDatabaseService() {
    return _instance;
  }

  Stream<QuerySnapshot<Facility>> getFacility() {
    return _facilityRef.snapshots();
  }

  Future<void> addFacility(Facility facility) async {
    await _facilityRef.add(facility);
  }

  Future<String?> getImageURL(String documentId) async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection(FACILITY_COLLECTION_REF)
          .doc(documentId)
          .get();

      if (documentSnapshot.exists) {
        return documentSnapshot['mainImageURL'] as String?;
      } else {
        print('Document not found');
        return null;
      }
    } catch (e) {
      print('Error fetching image URL: $e');
      return null;
    }
  }

  Future<String> getGeoLocationAsString(String documentId) async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('facilities')
          .doc(documentId)
          .get();

      if (!documentSnapshot.exists) {
        return 'Document not found';
      }

      GeoPoint geoPoint = documentSnapshot['location'];

      double latitude = geoPoint.latitude;
      double longitude = geoPoint.longitude;

      if (latitude < -90 ||
          latitude > 90 ||
          longitude < -180 ||
          longitude > 180) {
        return 'Invalid coordinates';
      }

      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);

      if (placemarks.isEmpty) {
        return 'No location found for these coordinates';
      }

      Placemark placemark = placemarks.first;

      String address = '';

      if (placemark.thoroughfare != null &&
          placemark.thoroughfare.toString().isNotEmpty) {
        address += '${placemark.thoroughfare!}, ';
      }
      if (placemark.subLocality != null &&
          placemark.subLocality.toString().isNotEmpty) {
        address += '${placemark.subLocality!}, ';
      }
      if (placemark.locality != null) {
        address += placemark.locality!;
      }

      return address.isNotEmpty ? address : 'Location details unavailable';
    } catch (e) {
      return 'Error fetching location}';
    }
  }

    Future<Widget> getOfferedSportsPriceRange(
      String facilityId, double screenWidth) async {
    try {
      QuerySnapshot sportsOfferedSnapshot = await FirebaseFirestore.instance
          .collection('facilities')
          .doc(facilityId)
          .collection('offeredSports')
          .get();

      if (sportsOfferedSnapshot.docs.isEmpty) {
        return Text('No sports offered',
            style: TextStyle(fontSize: screenWidth * 0.032));
      }

      if (sportsOfferedSnapshot.docs.length == 1) {
        int price = sportsOfferedSnapshot.docs.first['price'];

        return RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'P $price ',
                style: TextStyle(
                  fontSize: screenWidth * 0.032,
                  color: const Color(0xFF13131A),
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: 'per hour',
                style: TextStyle(
                  fontSize: screenWidth * 0.032,
                  color: const Color(0xFF5B5B5B),
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        );
      }

      int? lowestPrice;
      int? highestPrice;

      for (var sportDoc in sportsOfferedSnapshot.docs) {
        int price = sportDoc['price'];

        if (lowestPrice == null || price < lowestPrice) {
          lowestPrice = price;
        }

        if (highestPrice == null || price > highestPrice) {
          highestPrice = price;
        }
      }

      if (lowestPrice != null && highestPrice != null) {
        return RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'P $lowestPrice-$highestPrice ',
                style: TextStyle(
                  fontSize: screenWidth * 0.032,
                  color: const Color(0xFF13131A),
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: 'per hour',
                style: TextStyle(
                  fontSize: screenWidth * 0.032,
                  color: const Color(0xFF5B5B5B),
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        );
      } else {
        return Text('Price range unavailable',
            style: TextStyle(fontSize: screenWidth * 0.032));
      }
    } catch (e) {
      print('Error fetching sports price range: $e');
      return Text('Price range unavailable',
          style: TextStyle(fontSize: screenWidth * 0.032));
    }
  }

  Future<List<Widget>> getOfferedSports(
      String facilityId, double screenWidth) async {
    try {
      List<Widget> sportsWidgets = [];

      QuerySnapshot sportsOfferedSnapshot = await FirebaseFirestore.instance
          .collection('facilities')
          .doc(facilityId)
          .collection('offeredSports')
          .get();

      List<Future<void>> futures =
          sportsOfferedSnapshot.docs.map((sportDoc) async {
        String sportId = sportDoc['sportID'];

        QuerySnapshot courtsSnapshot =
            await sportDoc.reference.collection('courts').get();
        int courtCount = courtsSnapshot.docs.length;

        DocumentSnapshot sportSnapshot = await FirebaseFirestore.instance
            .collection('sports')
            .doc(sportId)
            .get();

        String sportName =
            sportSnapshot.exists ? sportSnapshot['sportName'] : 'Unknown Sport';

        sportsWidgets.add(
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '$courtCount',
                      style: TextStyle(
                        color: const Color(0xFF13131A),
                        fontSize: screenWidth * 0.032,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: ' $sportName',
                      style: TextStyle(
                        color: const Color(0xFF5B5B5B),
                        fontSize: screenWidth * 0.032,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList();

      await Future.wait(futures);

      return sportsWidgets.isNotEmpty
          ? [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (int i = 0; i < sportsWidgets.length; i++) ...[
                    sportsWidgets[i],
                    if (i < sportsWidgets.length - 1)
                      Text(
                        ' • ',
                        style: TextStyle(
                          color: const Color(0xFF5B5B5B),
                          fontSize: screenWidth * 0.032,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                  ],
                ],
              ),
            ]
          : [];
    } catch (e) {
      print('Error getting offered sports: $e');
      return [];
    }
  }

  Future<String> getFacilityType(String facilityId) async {
    try {
      CollectionReference offeredSportsRef = FirebaseFirestore.instance
          .collection('facilities')
          .doc(facilityId)
          .collection('offeredSports');

      QuerySnapshot offeredSportsSnapshot = await offeredSportsRef.get();

      if (offeredSportsSnapshot.docs.length > 1) {
        return 'Multi-Sport Facility';
      } else if (offeredSportsSnapshot.docs.length == 1) {
        DocumentSnapshot offeredSportDoc = offeredSportsSnapshot.docs[0];
        String sportID = offeredSportDoc['sportID'];

        DocumentSnapshot sportSnapshot = await FirebaseFirestore.instance
            .collection('sports')
            .doc(sportID)
            .get();

        if (sportSnapshot.exists) {
          String sportName = sportSnapshot['sportName'];
          return '$sportName Facility';
        }
      }

      return 'No Sports Available';
    } catch (e) {
      return 'Error fetching facility type';
    }
  }

    Future<GeoPoint> getGeoLocation(String documentId) async {
    DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection('facilities')
        .doc(documentId)
        .get();
    return doc['location'];
  }

  String getStaticMapUrl(double latitude, double longitude) {
    const String apiKey = 'YOUR_GOOGLE_MAPS_API_KEY';
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=15&size=600x300&markers=color:red%7C$latitude,$longitude&key=$apiKey';
  }

}