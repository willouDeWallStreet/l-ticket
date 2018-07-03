import 'package:flutter/material.dart';
import 'dart:async';
import 'homeScreen.dart';
import 'package:map_view/map_view.dart';

var apiKey = "AIzaSyDAU_exWXE3Pq99vWF3zO3xVx7rhoym_QA";
void main() {
  MapView.setApiKey(apiKey);
  runApp(new MaterialApp(
    home: new SplashScreen(),
    routes: <String, WidgetBuilder>{
      '/HomeScreen': (BuildContext context) => new HomeScreen()
    },
  ));
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 5);
    return new Timer(_duration, navigationPage);
  }
  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/HomeScreen');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Image.asset('images/transpole_logo2.png'),
      ),
    );
  }
}

