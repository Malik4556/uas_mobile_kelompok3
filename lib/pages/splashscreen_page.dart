import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ujicoba_uas/pages/login_page.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:flutter/animation.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Timer(
    //     const Duration(seconds: 3),
    //     () => Navigator.push(
    //         context, MaterialPageRoute(builder: (context) => LoginPage())));
  }

  @override
  Widget build(BuildContext context) {

    Widget example2 = SplashScreenView(
      navigateRoute: LoginPage(),
      duration: 5000,
      imageSize: 130,
      imageSrc: "images/LogoSTTB.png",
      text: "AKADEMIK",
      textType: TextType.ColorizeAnimationText,
      textStyle: TextStyle(
        fontSize: 40.0,
      ),
      colors: [
        Colors.purple,
        Colors.blue,
        Colors.yellow,
        Colors.red,
      ],
      backgroundColor: Colors.white,
    );
    return MaterialApp(
      home: example2,
          
    );
  }
}
