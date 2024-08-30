
import 'package:court_pass/screens/auth/fillup.dart';
import 'package:court_pass/screens/pages/history.dart';
import 'package:court_pass/screens/auth/user_selection.dart';
import 'package:court_pass/screens/pages/home.dart';
import 'package:court_pass/screens/pages/messages.dart';
import 'package:court_pass/screens/pages/profile.dart';
import 'package:court_pass/screens/pages/request.dart';
import 'package:court_pass/screens/pages/request_schedules.dart';
import 'package:flutter/material.dart';

void main(){
   runApp(App());
}

class App extends StatelessWidget{
  const App({super.key});

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Schedules(),
    );
  }
}