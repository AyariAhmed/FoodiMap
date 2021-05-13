import 'package:flutter/material.dart';
import 'package:foodimap_flutter/screens/splash/components/body.dart';
import 'package:foodimap_flutter/size_config.dart';

class SplashScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
