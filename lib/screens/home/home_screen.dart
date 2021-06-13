import 'package:flutter/material.dart';
import 'package:foodimap_flutter/screens/home/components/body.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName= '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accueil'),
      ),
      body: Body(),
    );
  }
}
