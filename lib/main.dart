import 'package:flutter/material.dart';
import 'package:myapp/screens/homepage.dart';
import 'package:myapp/screens/login.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new MyApp(),
    routes: {
      HomePage.routeName: (ctx) => HomePage(),
    },
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 3,
      navigateAfterSeconds: new Login(),
      title: new Text(
        'Sun Info Technologies',
        style: new TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.white),
      ),
      image: Image.asset("assets/images/sun.jpg"),
      backgroundColor: Colors.black,
      photoSize: 100.0,
      loaderColor: Colors.blue,
    );
  }
}
