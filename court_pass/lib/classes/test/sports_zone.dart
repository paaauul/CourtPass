import 'package:court_pass/classes/facility.dart';
import 'package:court_pass/classes/facility_rating.dart';
import 'package:court_pass/classes/sport.dart';
import 'package:court_pass/classes/sports.dart';
import 'package:flutter/cupertino.dart';

class SportsZone extends Facility{
  
  late String message = "Asa naman ka animala ka!";

  SportsZone(){
    name = "Sports Zone";
    facilityType = "Multi-Sport Facility";

    averageRating = 4.82;
    numberOfReviews = 167;

    timeStart = "9:00 AM";
    timeEnd = "8:00 PM";
    location = "Paseo Del Rio, Macasanding, Cagayan de Oro City";

    about = "Sportszone, located on Paseo Del Rio, Cagayan de Oro City, Misamis Oriental, Philippines, is a multifaceted sports complex. It offers a variety of recreational venues and sports courts ideal for events and athletic activities. To ensure high attendance, the facility requires a down-payment for each reservation. Additionally, visitors can enjoy other recreational sports such as table tennis, billiards, darts, and pool.";
    
    profilePicture = Image.asset("assets/images/sz.jpeg");

    var sports = Sports();
    offeredSports = [
      sports.sports.firstWhere((sport) => sport.sportName == "Badminton"),
      sports.sports.firstWhere((sport) => sport.sportName == "Table Tennis"),
      sports.sports.firstWhere((sport) => sport.sportName == "Billiards"),
    ];

    facilityRatings = [
      FacilityRating(SportsZone().name, "LeBron James", 4.8, "Nice Court to play badminton! I'll retire and play badminton"),
      FacilityRating(SportsZone().name, "Steph Curry", 5.0, "Great facility! great place to practice my serves"),
      FacilityRating(SportsZone().name, "Jerry Layug", 4.0, "Met Lebron and Steph during my time at the facility!"),
    ];
  }
}