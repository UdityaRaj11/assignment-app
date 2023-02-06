import 'package:assignment_app/Screens/options_screen.dart';
import 'Screens/homepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';

void main() {
// async {
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  List<Widget> selectedWidgets = [];
  List<String> selectedOptions = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.green,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      routes: {
        '/': (ctx) => HomePage(selectedWidgets, selectedOptions),
        OptionsScreen.routeName: (ctx) => OptionsScreen(
              selectedOptions,
            )
      },
    );
  }
}
