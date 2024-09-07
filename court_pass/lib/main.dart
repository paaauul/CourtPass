
import 'package:court_pass/screens/pages/history/history.dart';
import 'package:court_pass/screens/pages/home.dart';
import 'package:court_pass/screens/pages/messaging/conversation.dart';
import 'package:court_pass/screens/pages/messaging/messages.dart';
import 'package:court_pass/screens/pages/profile.dart';
import 'package:court_pass/screens/pages/requesting/request.dart';
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
      home: HistoryPage(),
    );
  }
}