import 'package:flutter/material.dart';
import 'package:alacare5/views/SignUpScreen.dart'; // Replace with the actual file path

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Add a delay of 3 seconds before navigating to SignUpScreen
    Future.delayed(Duration(seconds: 3), () {
      // Navigate to the next screen (SignUpScreen)
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => SignUpScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.lightBlueAccent, Colors.white],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              padding: EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                top: 70.0,
                bottom: 20.0,
              ),
              child: new Text(
                "Hello World",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            new Container(
              padding: EdgeInsets.all(10.0),
              child: new Icon(
                Icons.bubble_chart,
                color: Colors.white,
                size: 130.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
