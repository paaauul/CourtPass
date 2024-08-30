import 'package:court_pass/classes/facility_rating.dart';
import 'package:court_pass/classes/sport.dart';
import 'package:flutter/cupertino.dart';

class Facility {
  late String name;
  late String facilityType;
  late int _loginCode;
  late String location;

  late String timeStart;
  late String timeEnd;

  late String about;

  late double averageRating;
  late int numberOfReviews;

  List<Sport> offeredSports = [];
  List<FacilityRating> facilityRatings = [];

  int get loginCode => _loginCode;

  late Image profilePicture;
}