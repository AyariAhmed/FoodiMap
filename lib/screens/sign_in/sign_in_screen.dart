import 'package:flutter/material.dart';
import 'package:foodimap_flutter/screens/sign_in/components/body.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";
  const SignInScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("S'identifier"),
      ),
      body: Body(),
    );
  }
}
