import 'package:flutter/material.dart';
import 'package:weather_now/screens/splashscreen.dart';

import 'services/navigation_service.dart';

void main() => runApp(
      MyApp(),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: NavigationService.navigatorKey,
        theme: ThemeData.dark(),
        home: SplashScreen());
  }
}
