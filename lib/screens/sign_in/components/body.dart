import 'package:flutter/material.dart';
import 'package:foodimap_flutter/components/custom_suffix_icon.dart';
import 'package:foodimap_flutter/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Column(
          children: [
            Text(
              'Bon Retour Chez Nous!',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: getProportionateScreenWidth(25),
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
              child: Text(
                "Identifiez Vous avec votre Email/Num de telephone et votre mot de passe",
                textAlign: TextAlign.center,
              ),
            ),
            SignForm()
          ],
        ),
      ),
    ));
  }
}

class SignForm extends StatefulWidget {
  const SignForm({Key key}) : super(key: key);

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
                labelText: "Email/Numéro de telephone",
                hintText: "Email/Télephone",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: customSuffix(svgIcon : "assets/icons/Mail.svg")),
          )
        ],
      ),
    );
  }
}


