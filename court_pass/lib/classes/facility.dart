import 'package:court_pass/classes/facility_rating.dart';
import 'package:court_pass/classes/sport.dart';
import 'package:flutter/cupertino.dart';

class Facility {
  late String name;
  late String facilityType;
  late String location;

  late String timeStart;
  late String timeEnd;

  late String about;

  late double averageRating;
  late int numberOfReviews;

  List<Sport> offeredSports = [];
  List<FacilityRating> facilityRatings = [];

  late Image profilePicture;

  Facility({
  required this.name,
  required this.facilityType,
  required this.location,
  required this.timeStart,
  required this.timeEnd,
  required this.about
  });

  Facility.fromJson(Map <String, Object?> json)
  : this(
      name: json['name']! as String,
      facilityType: json['facilityType']! as String,
      location: json['location']! as String,
      timeStart: json['timeStart']! as String,
      timeEnd: json['timeEnd']! as String,
      about: json['about']! as String,
  );

  Facility copyWith({
  String? name,
  String? facilityType,
  String? location,
  String? timeStart,
  String? timeEnd,
  String? about
  }){
    return Facility(
    name: name?? this.name,
    facilityType: facilityType?? this.facilityType,
    location: location?? this.location,
    timeStart: timeStart?? this.timeStart,
    timeEnd: timeEnd?? this.timeEnd,
    about: about?? this.about
    );
  }

  Map<String, Object?> toJson(){
    return{
    'name': name,
    'facilityType': facilityType,
    'location': location,
    'timeStart': timeStart,
    'timeEnd': timeEnd,
    'about': about
    };
  }
}