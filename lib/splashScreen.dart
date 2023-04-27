import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class MySplashScreen extends StatefulWidget {
  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 10,
      title: Text(
        "AR  Face  Filters  App",
        style: TextStyle(
          fontSize: 55,
          color: Colors.deepPurpleAccent,
          fontFamily: "Signatra",
        ),
      ),
      image: Image.asset("images/icon.png"),
      backgroundColor: Colors.white,
      photoSize: 140,
      loaderColor: Colors.deepPurple,
      loadingText: Text(
        "from Fahad",
        style: TextStyle(
          color: Colors.deepPurpleAccent,
          fontSize: 16.0,
          fontFamily: "Brand Bold",
        ),
      ),
    );
  }
}
