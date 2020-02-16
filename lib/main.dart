import 'package:cr_personal_expenses/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(

      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.purple,
          fontFamily: 'Exo2',
          errorColor: Colors.red,
          textTheme: TextTheme(
              button: TextStyle(
                  color: Colors.white
              )
          )
      ),
      home: MyHomePage(title: 'Personal Expenses'),
    );
  }
}
