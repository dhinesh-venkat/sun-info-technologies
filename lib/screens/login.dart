import 'package:flutter/material.dart';
import 'package:myapp/screens/homepage.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController controller = TextEditingController();
  final String _password = "123456789";
  bool _validate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Login",
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        padding: EdgeInsets.all(14.0),
        child: Center(
            child: Column(
          children: <Widget>[
            Container(
              height: 120,
              width: 100,
              child: Column(
                children: <Widget>[
                  Image.asset(
                    "assets/images/lock.png",
                    fit: BoxFit.cover,
                  ),
                  Text(
                    "Locked",
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: TextField(
                cursorColor: Colors.blue,
                controller: controller,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter PIN",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  errorText: _validate ? "Field is Empty" : null,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(14.0),
              child: RaisedButton(
                onPressed: () {
                  setState(() {
                    controller.text.isEmpty
                        ? _validate = true
                        : _validate = false;
                  });
                  if (controller.text == _password) {
                    _validate = true;
                    Navigator.of(context)
                        .pushNamed(HomePage.routeName);
                  }
                  else {

                  }
                },
                padding: EdgeInsets.all(14.0),
                color: Colors.orange,
                child: Text(
                  "-> Login",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
