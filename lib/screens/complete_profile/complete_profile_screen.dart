import 'package:flutter/material.dart';
import 'package:foodimap_flutter/screens/complete_profile/Components/body.dart';

class CompleteProfileScreen extends StatelessWidget {
  static const String routeName = "/complete_profile";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Body(),
    );
  }
}
