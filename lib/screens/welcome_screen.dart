import 'package:flutter/material.dart';
import 'package:weather_now/screens/loading_screen.dart';
import 'package:flutter_gif/flutter_gif.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
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

    // // jumpTo thrid frame(index from 0)
    // controller?.value = 0;

    // // from current frame to 26 frame
    // controller?.animateTo(26);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Hero(
                  tag: "weatherblackbg",
                  child: GifImage(
                    controller: controller!,
                    image: AssetImage("images/weatherblackbg.gif"),
                    gaplessPlayback: true,
                    height: 300,
                  )

                  // ),
                  ),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "Discover the Weather in Your City",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Get to know the current weather forecast in your location and around the world",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white.withOpacity(.8)),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => LoadingScreen()),
                    ));
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
              ),
              child: Text(
                "Get Started",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
