import 'package:court_pass/screens/auth/sports_person/sportsperson_login.dart';
import 'package:court_pass/screens/auth/user_selection.dart';
import 'package:court_pass/screens/pages/sports_person/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class SportsPersonMainPage extends StatelessWidget{
  const SportsPersonMainPage({super.key});


  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return const Home();
          }
          else{
            return const UserSelectionPage();
          }
        },
      )
    );
  }
}