import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:court_pass/classes/sports_person.dart';
import 'package:firebase_auth/firebase_auth.dart';

const String SPORTSPERSONS_COLLECTION_REF = "sports_persons";

class SportsPersonDatabaseService {
  final _firestore = FirebaseFirestore.instance;
  late final CollectionReference<SportsPerson> _sportsPersonRef;

  SportsPersonDatabaseService() {
    _sportsPersonRef = _firestore.collection(SPORTSPERSONS_COLLECTION_REF).withConverter<SportsPerson>(
      fromFirestore: (snapshots, _) => SportsPerson.fromJson(
        snapshots.data()!,
      ),
      toFirestore: (sportsPerson, _) => sportsPerson.toJson(),
    );
  }

  Stream<QuerySnapshot<SportsPerson>> getSportsPerson() {
    return _sportsPersonRef.snapshots();
  }

  void addSportsPerson(SportsPerson sportsPerson) async {
    await _sportsPersonRef.add(sportsPerson);
  }

  Future<void> signUpSportsPerson(String firstName, String lastName, String email) async {
    User? currentUser = FirebaseAuth.instance.currentUser;

    String uid = currentUser!.uid;

    SportsPerson sportsPerson = SportsPerson(
      firstName: firstName,
      lastName: lastName,
      email: email,
      mobileNumber: '',
    );

    await _sportsPersonRef.doc(uid).set(sportsPerson);
  }

  Future<void> completeAccountCreation(String mobileNumber) async {
    User? currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      await _sportsPersonRef.doc(currentUser.uid).update({
        'mobileNumber': mobileNumber,
      });
    } else {
      throw Exception("No user is currently signed in.");
    }
  }

  Future<String?> getCurrentUserFirstName() async {
    User? currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      DocumentSnapshot<SportsPerson> snapshot = await _sportsPersonRef.doc(currentUser.uid).get();

      if (snapshot.exists) {
        SportsPerson sportsPerson = snapshot.data()!;
        return sportsPerson.firstName;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  Future<String?> getCurrentUserLastName() async {
    User? currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      DocumentSnapshot<SportsPerson> snapshot = await _sportsPersonRef.doc(currentUser.uid).get();

      if (snapshot.exists) {
        SportsPerson sportsPerson = snapshot.data()!;
        return sportsPerson.lastName;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  Future<String?> getCurrentUserEmail() async {
    User? currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      DocumentSnapshot<SportsPerson> snapshot = await _sportsPersonRef.doc(currentUser.uid).get();

      if (snapshot.exists) {
        SportsPerson sportsPerson = snapshot.data()!;
        return sportsPerson.email;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  Future<String?> getCurrentUserMobileNumber() async {
    User? currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      DocumentSnapshot<SportsPerson> snapshot = await _sportsPersonRef.doc(currentUser.uid).get();

      if (snapshot.exists) {
        SportsPerson sportsPerson = snapshot.data()!;
        return sportsPerson.mobileNumber;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

}
