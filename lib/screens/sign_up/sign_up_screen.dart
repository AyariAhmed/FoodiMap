import 'package:flutter/material.dart';

import 'components/body.dart';


class SignUpScreen extends StatelessWidget {
  static const String routeName = '/sign_up';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('S\'inscrire'),
      ),
      body: Body(),
    );
  }
}
