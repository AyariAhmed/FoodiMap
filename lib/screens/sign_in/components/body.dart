import 'package:flutter/material.dart';
import 'package:foodimap_flutter/components/custom_suffix_icon.dart';
import 'package:foodimap_flutter/components/default_button.dart';
import 'package:foodimap_flutter/components/form_error.dart';
import 'package:foodimap_flutter/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
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
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = ["Demo Error"];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          buildPasswordFormField(),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          FormError(errors: errors),
          DefaultButton(
              text: "Continuer",
              press: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                }
              }),
        ],
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      validator: (value) {
        if (value.isEmpty &&
            !errors.contains(
                "Prière d'ajouter votre Email ou Numéro de Téléphone")) {
          setState(() {
            errors.add("Prière d'ajouter votre Email ou Numéro de Téléphone");
          });
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: "Email/Numéro de telephone",
          hintText: "Email/Télephone",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: customSuffix(svgIcon: "assets/icons/Mail.svg")),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      validator: (value) {
        if (value.isEmpty &&
            !errors.contains("Prière d'ajouter votre Mot de passe")) {
          setState(() {
            errors.add("Prière d'ajouter votre Mot de passe");
          });
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: "Mot de passe",
          hintText: "Mot de passe",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: customSuffix(svgIcon: "assets/icons/Lock.svg")),
    );
  }
}
