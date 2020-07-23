import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final String _animationName = "composition 1";
  bool _isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(14.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                child: FlareActor(
                  _isSwitched
                      ? "assets/vectors/Listening.flr"
                      : "assets/vectors/Reading.flr",
                  alignment: Alignment.center,
                  fit: BoxFit.contain,
                  animation: _animationName,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text("Reading"),
                  Switch(
                    value: _isSwitched,
                    onChanged: (value) {
                      setState(() {
                        _isSwitched = value;
                      });
                    },
                    activeTrackColor: Colors.green,
                    activeColor: Colors.white,
                    inactiveTrackColor: Colors.yellow,
                  ),
                  Text("Listening"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
