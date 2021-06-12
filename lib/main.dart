import 'package:flutter/material.dart';
import 'package:foodimap_flutter/constants.dart';
import 'package:foodimap_flutter/routes.dart';
import 'package:foodimap_flutter/screens/splash/splash_screen.dart';
import 'package:foodimap_flutter/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FoodiMap',
      debugShowCheckedModeBanner: false,
      theme: theme(),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}

