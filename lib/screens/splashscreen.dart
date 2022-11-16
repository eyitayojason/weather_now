import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_gif/flutter_gif.dart';
import 'package:weather_now/screens/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  FlutterGifController? controller;

  @override
  void initState() {
    super.initState();
    controller = FlutterGifController(
      vsync: this,
      animationBehavior: AnimationBehavior.preserve,
    );
    // loop from 0 frame to 29 frame
    controller?.repeat(
        min: 0, max: 100, period: const Duration(milliseconds: 2500));

    Timer(Duration(seconds: 5), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: ((context) => WelcomeScreen()),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: double.infinity,
        alignment: Alignment.center,
        child: Center(
          child: Hero(
              tag: "weatherblackbg",
              child: GifImage(
                controller: controller!,
                image: AssetImage("images/weatherblackbg.gif"),
                gaplessPlayback: true,
                height: 150,
              )),
        ),
      ),
    );
  }
}
