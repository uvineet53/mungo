import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mungo/ui/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print("error");
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            theme: ThemeData(
              primaryColor: Color(0xff1a202c),
              scaffoldBackgroundColor: Color(0xff1a202c),
            ),
            home: AuthHomePage(),
          );
        }

        return CircularProgressIndicator();
      },
    );
  }
}
